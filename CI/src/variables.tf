###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


#Блок образа
variable "vm_web_name_image" {
  default     = "centos-7-gpu"
  #description = "VPC network & subnet name"
}

#Блок для ввода итератора count
variable "count_iterrator"{ 
  default = 1
  description = "count_iterrator"
}


#Переменная для создания ВМ 
variable "vm_resource" {
  type = map(object({  
    vm_name=string, 
    platform = string,
    cpu=number, 
    ram=number, 
    core_fraction = number,
    nat = bool,
    disk_type = string,
    disk_size = number
    }))
  default = { 
      "storage" = {
      vm_name="vector", 
      platform = "standard-v1"
      cpu=2, 
      ram=2, 
      core_fraction = 20, 
      nat = true,
      disk_type = "network-hdd" ,
      disk_size = 30
    } ,

    "web"= {
      vm_name="clickhouse", 
      platform = "standard-v1"
      cpu=2, 
      ram=2, 
      core_fraction = 20, 
      nat = true,
      disk_type = "network-hdd" ,
      disk_size = 30
    } ,

    "inst"= {
      vm_name="lighthouse", 
      platform = "standard-v1"
      cpu=2, 
      ram=2, 
      core_fraction = 20, 
      nat = true,
      disk_type = "network-hdd" ,
      disk_size = 30
    }
  }
}