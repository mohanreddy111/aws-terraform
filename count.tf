#list=mentin multiple values

resource "aws_vpc" "myvpc" {

  cidr_block = var.cidr_block[2]

  tags = {
    Name = var.vpc
  }
}

# variables declaration

variable "cidr_block" {

  type = list(string)

  #         0             1             2
  default = ["10.0.0.0/16","10.0.1.0/24","10.0.2.0/24"]

  description = "eligible ip address range"
}

variable "vpc" {

  type = string

  default = "viswa"

  description = "vpc name"
}


#count =  use to create multple resource

resource "aws_vpc" "myvpc1" {

count = 4 
#or count= length(var.ipaddress) use this put acount.index

  cidr_block =var.ipaddress[count.index]

  tags = {
    Name = var.vpc[count.index]
  }
}

# variables declaration

variable "ipaddress" {

  type = list

  ########         0             1             2            3
  default = ["10.0.0.0/16","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]

  description = "eligible ip address range"
}

variable "vpc" {

  type = list

  default = ["viswa", "viswa2, ","viswa3","viswa1"]

  description = "vpc name"
}



 
#string = is create only one value

variable "vpc_name" {

  type = string

  default = "viswa-vpc"
}

resource "aws_vpc" "myvpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}
# variables
variable "instance_name" {

  type = string

  default = "web-server"
}

variable "env" {

  type = string

  default = "dev"
}