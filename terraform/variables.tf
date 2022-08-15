variable "externalIP" {
    type = string
    default = "51.250.82.247"  
}

variable "cloud_id" {
    type = string
    default = "b1gujivevjlp7t5e57pg"  
}

variable "folder_id" {
    type = string
    default = "b1ggm5c63bsod5kmc3cg"  
}

variable "token" {
  type = string
  default = "AQAEA7qgtYQrAATuwYto7rijDENcg3gH-jk5RWw"
}

variable "s3_access_key" {
  type = string
  default = "YCAJEZavO9m1ZXwmnRgME3Sci"
}

variable "s3_secret_key" {
  type = string
  default = "YCMK0KGedZY_8rJlheGESuN8a8_aSSyEOtlK_MNs"
}

variable "os_username" {
  type = string
  default = "ubuntu"
}

variable "ssh_rsa_pub_path" {
    type = string
    default = "~/.ssh/id_rsa.pub"
  
}


variable "subnet_a_gateway" {
    type = string
    default = "10.0.0.254"
  
}

/*
resource "yandex_storage_bucket" "diplomabucket1" {
  access_key = "YCAJEZavO9m1ZXwmnRgME3Sci"
  secret_key = "YCMK0KGedZY_8rJlheGESuN8a8_aSSyEOtlK_MNs"
  bucket = "diplomabucket1"
}*/