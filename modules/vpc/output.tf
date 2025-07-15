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

# export vpc cidr
output "vpc_cidr" {
    value = var.vpc_cidr
}

# public subnet az1 cidr
output "public_subnet_az1_cidr" {
    value = var.public_subnet_az1_cidr
}

# public subnet az2  cidr
output "public_subnet_az2_cidr" {
    value = var.public_subnet_az2_cidr
}

# private app subnet az1 cidr 
output "private_app_subnet_az1_cidr" {
    value = var.private_app_subnet_az1_cidr
}

# private app subnet az2 cidr 
output "private_app_subnet_az2_cidr" {
    value = var.private_app_subnet_az2_cidr
}

# private data subnet az1 cidr 
output "private_data_subnet_az1_cidr" {
    value = var.private_app_subnet_az1_cidr
}

# private data subnet az2 cidr 
output "private_data_subnet_az2_cidr" {
    value = var.private_data_subnet_az2_cidr
}