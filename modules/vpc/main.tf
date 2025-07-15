# create vpc 
resource "aws_vpc" "vpc" {
    cidr_block = ""
    instance_tenancy = "default"

    tags = {
      Name = "{var.project_name}-vpc"
    }
    
  
}

# internet gateway
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id 

    tags = {
      Name = "{var.project_name}-internet-gateway"
    }
  
}

# use data source to get all the availability zones
data "aws_availability_zones" "availability_zones" {}

# create Public subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id = aws_vpc.vpc.id 
cidr_block = var.public_subnet_az1_cidr
availability_zone = data.aws_availability_zones.availability_zones.names[0]
map_public_ip_on_launch = true

tags = {
      Name = "{var.project_name}-public_subnet_az1"
    }

}


# create Public subnet az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.vpc.id 
cidr_block = var.public_subnet_az2_cidr
map_public_ip_on_launch = true
availability_zone = data.aws_availability_zones.availability_zones.names[1]

tags = {
      Name = "{var.project_name}-public_subnet_az2"
    }

}

# create public route table 
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id 

    route {
        cidr_block = "0.0.0.0/16"
        gateway_id = aws_internet_gateway.internet_gateway.id 
    }
  
}

# associate public subnet az1 to public route table
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  route_table_id = aws_route_table.public_route_table.id 
  subnet_id = aws_subnet.public_subnet_az1.id 

}


# associate public subnet az2 to public route table
resource "aws_route_table_association" "public_subnet_az2_rt_association" {
  route_table_id = aws_internet_gateway.internet_gateway.id 
  subnet_id = aws_subnet.public_subnet_az2.id  

}

# create a private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_app_subnet_az1_cidr
    availability_zone = data.aws_availability_zones.availability_zones.name[0]

    tags = {
      Name = "{var.project_name}-private_app_subnet_az1"
    }

}


# create a private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_app_subnet_az2_cidr
    availability_zone = data.aws_availability_zones.availability_zones.name[1]

    tags = {
      Name = "{var.project_name}-private_app_subnet_az2"
    }

}


# create a private data subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_data_subnet_az1_cidr
    availability_zone = data.aws_availability_zones.availability_zones.name[0]

    tags = {
      Name = "{var.project_name}-private_data_subnet_az1"
    }

}
  

# create a private data subnet az2
resource "aws_subnet" "private_app_subnet_az1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_data_subnet_az2_cidr
    availability_zone = data.aws_availability_zones.availability_zones.name[0]

    tags = {
      Name = "{var.project_name}-private_data_subnet_az2"
    }

}