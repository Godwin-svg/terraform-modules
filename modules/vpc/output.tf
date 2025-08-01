# export the region 
output "region" {
    value = var.region
}

# export project name
output "project_name" {
    value = var.project_name
}

# export the environment 
output "environment" {
    value = var.environment
  
}

# export vpc id 
output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

# export internetgateway
output "internet_gateway" {
    value = aws_internet_gateway.internet_gateway
  
}



# public subnet az1 id 
output "public_subnet_az1_id" {
    value = aws_subnet.public_subnet_az1.id 
}

# public subnet az2  id
output "public_subnet_az2_id" {
    value = aws_subnet.public_subnet_az2.id 
}

# private app subnet az1 id  
output "private_app_subnet_az1_id" {
    value = aws_subnet.private_app_subnet_az1.id 
}

# private app subnet az2 id  
output "private_app_subnet_az2_id" {
    value = aws_subnet.private_app_subnet_az2.id 
}

# private data subnet az1 id  
output "private_data_subnet_az1_id" {
    value = aws_subnet.private_data_subnet_az1.id 
}

# private data subnet az2 id  
output "private_data_subnet_az2_id" {
    value = aws_subnet.private_data_subnet_az2.id 
}