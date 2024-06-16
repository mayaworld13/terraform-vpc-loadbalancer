variable "region" {
  type = string
}
variable "vpc" {
  type = string

}
variable "ports" {
  type = list(number)

}

variable "tg-name" {
  type = string

}

variable "target_port" {
  type = string
}

variable "enduserport" {
  type = string

}

variable "tg_protocol" {

  type = string
}

variable "load_balancer-name" {
  type = string

}

variable "elb-type" {
  type = string

}

variable "Environment" {
  type = string

}

variable "ami" {
  type = string

}

variable "instance_type" {
  type = string

}

variable "key_name" {
  type = string

}


variable "host-name" {

  type = string
}

variable "connection-user" {
  type = string
}



variable "private1a" {
  type = string

}

variable "private1b" {
  type = string

}