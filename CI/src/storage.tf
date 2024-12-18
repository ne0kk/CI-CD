

resource "yandex_compute_instance" "storage" {
  #depends_on = "" #[yandex_compute_instance.bastion]

  count = var.count_iterrator

  name        = "${var.vm_resource.storage.vm_name}-0${count.index+1}" #Имя ВМ в облачной консоли
  hostname    = "${var.vm_resource.storage.vm_name}-0${count.index+1}" #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = var.vm_resource.storage.platform

  resources {
    cores         = var.vm_resource.storage.cpu
    memory        = var.vm_resource.storage.ram
    core_fraction = var.vm_resource.storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
      type     = var.vm_resource.storage.disk_type
      size     = var.vm_resource.storage.disk_size
    }
  }

  metadata = local.metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_resource.storage.nat
  }
}
