
variable "region" {
  type = string
  default = "us-west-1"
}


variable "environment" {
  type = string
  default = "dev"
}


variable "instance_types" {
  type    = "map"
  default = {
    "dev" = "t2.small"
    "prod" = "t3.large"
  }
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-fc0b939c"
  }
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-west-1a"]
}

variable "security_groups" {
  type    = list(string)
  default = ["sg-1436abcf"]
}