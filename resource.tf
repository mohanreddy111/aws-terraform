#ec2 creation block
#resource block,resource type, resource name 

resource "aws_vpc" "vpc01" {
  cidr_block = "10.0.1.0/24"
  tags = {
    name = "viswa-vpc"
  }
}

#subnet block 

resource "aws_subnet" "subnet01" {
  vpc_id = aws_vpc.vpc01.id #resourcetype.resource name.id

  cidr_block = "10.0.1.0/24"
  tags = {
    name = "viswa-subnet"
  }

}

#internet gate way

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc01.id
  tags = {
    name = "viswa_gw"
  }

}

#default route table
resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.vpc01.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    name = "viswa_igw"
  }

}

#default security grop
resource "aws_default_route_table" "example" {
  default_route_table_id = aws_route_table.route1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}