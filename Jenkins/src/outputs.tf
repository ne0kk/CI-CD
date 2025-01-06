
output "jenkins-agent" {
  value = tomap({
    for inst in yandex_compute_instance.web : inst.name => {
      name                = inst.name
      id                  = inst.id
      fqdn                = inst.fqdn
      ip                  = inst.network_interface[0].nat_ip_address
    }
  })
}


output "jenkins-master" {
  value = tomap({
    for inst in yandex_compute_instance.storage : inst.name => {
      name                = inst.name
      id                  = inst.id
      fqdn                = inst.fqdn
      ip                  = inst.network_interface[0].nat_ip_address
    }
  })
}

