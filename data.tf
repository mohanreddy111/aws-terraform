#data block (use to call exiting rezource  via created by manual)
#data → used to read existing AWS resource
#aws_vpc → resource type
##selected → name (can be anything)

data "aws_vpc" "selected" {
id = var.vpc_id   
}
output "vpc_id" {
 #resource block,resource type,resource name   
value = dat.aws_vpc.selected.id
  
}
#output block 
#use to call exiting code by declarteing output values
 

 