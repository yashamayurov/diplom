terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
   backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "diplomabucket1"
    region     = "ru-central1"
    key        = "global/s3/terraform.tfstate"
    access_key = "YCAJEZavO9m1ZXwmnRgME3Sci"
    secret_key = "YCMK0KGedZY_8rJlheGESuN8a8_aSSyEOtlK_MNs"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  cloud_id  = "${var.cloud_id}"    
  folder_id = "${var.folder_id}"   
  zone      = "ru-central1-a"  
}

resource "yandex_compute_image" "ubuntu-image" {
  name       = "ubuntu2004lts"
  source_image = "fd8ofg98ci78v262j491"
}

resource "yandex_compute_image" "nat-instance-image" {
  name       = "nat-instance"
  source_image = "fd8josjq21d56924jfan"
}
# Виртуальная машина с nginx и nat-instance
resource "yandex_compute_instance" "nginx1" {
  name = "nginx"
  hostname = "nginx1"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.nat-instance-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = true
    nat_ip_address = "${var.externalIP}"
    ip_address = "${var.subnet_a_gateway}"
    
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  }
  
}
# Виртуальные машины для mySql
resource "yandex_compute_instance" "my-sql" {
  name = "db0${count.index}"
  hostname = "db0${count.index}"
  allow_stopping_for_update = true
  count = 2

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  }
  
}
# Виртуальная машина для работы Wordpress
resource "yandex_compute_instance" "app" {
  name = "app"
  hostname = "app"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
   
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  }
  
}
# Виртуальная машина для установки Gitlab
resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"
  hostname = "gitlab"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      size = 15
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  }
  
}
# Виртуальная машина для установки сервисо мониторинга
resource "yandex_compute_instance" "monitoring" {
  name = "monitoring"
  hostname = "monitoring"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
   
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
  }
  metadata = {
    ssh-keys = "${var.os_username}:${file(var.ssh_rsa_pub_path)}"
  }
  
}
