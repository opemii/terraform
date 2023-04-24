variable "public_cidr" {
  type = list
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_cidr" {
  type = list
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "db_cidr" {
  type = list
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}
variable "azs"{
  type = list
  default = ["us-east-1a", "us-east-1b"]
}


variable "database_name" {
  default = "terraformdb"
}
variable "database_password" {
  default = "terraformpass"
}

variable "database_user" {
  default = "terraformuser"
}
