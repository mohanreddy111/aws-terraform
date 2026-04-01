# using output values call existin vpc code 
resource "aws_subnet" "name" {
    #resource block,resource type resource name 
    vpc_id = data.aws_vpc.selected.vpc_id
cidr_block = "172.0.0.0/24"
tags = {
  name = "viswa_subnet"
}
  
}
#above useing exiting vpc code create a subnet