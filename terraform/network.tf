resource "yandex_vpc_network" "network-1" {
  name = "diploma-network1"
}

resource "yandex_vpc_subnet" "subnet-a" {
  name           = "subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.0.0.0/24"]
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

resource "yandex_vpc_subnet" "subnet-b" {
  name           = "subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.10.0.32/27"]
}

resource "yandex_vpc_subnet" "subnet-c" {
  name           = "subnet-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.10.0.64/27"]
}

resource "yandex_vpc_route_table" "nat-instance-route" {
  network_id = yandex_vpc_network.network-1.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "${var.subnet_a_gateway}"
  }
}