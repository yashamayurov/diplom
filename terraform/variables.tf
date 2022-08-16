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
