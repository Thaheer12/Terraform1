variable "region" {
  default = "us-east-1"
}

variable "vpc-cidr" {
  default = "192.125.0.0/16"
}

variable "publicsubnet-cidr" {
  type = "list"
  default = ["192.125.1.0/26","192.125.2.0/26"]
}
variable "privatesubnet-cidr" {
  type = "list"
  default = ["192.125.3.0/26","192.125.4.0/26"]
}
variable "default-cidr" {
  default = "0.0.0.0/0"
}
variable "nat-ami" {
  default = "ami-01623d7b"
}
variable "ami" {
  default = "ami-0ff8a91507f77f867"
}
variable "numberofprivate" {
  default = "1"
}
variable "numberofNat" {
  default = "1"
}
variable "keyname" {
  default = "aws"
}

data "aws_availability_zones" "available" {}
