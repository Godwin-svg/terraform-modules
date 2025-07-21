# allocation elastic ip, this eip will be use for the nat-gateway in the public subnet az1
resource "aws_eip" "eip1" {
    domain = "vpc"

    tags = {
      Nmae = "${var.project_name}-${var.environment}-ep1"
    }
  
}

# allocation elastic ip, this eip will be use for the nat-gateway in the public subnet az2
resource "aws_eip" "eip2" {
    domain = "vpc"

    tags = {
       Nmae = "${var.project_name}-${var.environment}-ep2"
    }
  
}

# create nat gateway in public az1
resource "aws_nat_gateway" "nat_gateway_az1" {
    allocation_id = aws_eip.eip1.id 
    subnet_id = var.public_subnet_az1_id  

    tags = {
      Nmae = "${var.project_name}-${var.environment}-nat-gateway-az1"
    }

    depends_on = [var.internet_gateway]
  
}

# create nat gateway in public az2
resource "aws_nat_gateway" "nat_gateway_az2" {
    allocation_id = aws_eip.eip2.id 
    subnet_id = var.public_subnet_az2_id  

    tags = {
      Nmae = "${var.project_name}-${var.environment}-nat-gateway-az2"
    }

    depends_on = [var.internet_gateway]
  
}

# create private route table az1 and add route through nat gateway az1 
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id 
  }

  tags = {
      Nmae = "${var.project_name}-${var.environment}-private-rt-az1"
    }
  
}


# create private route table az2 and add route through nat gateway az1 
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id 
  }

  tags = {
      Nmae = "${var.project_name}-${var.environment}-private-rt-az2"
    }
  
}

# associate private app subnet az1 with private route table az1
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id = var.private_app_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id 
  
}

# associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az1_rt_az2_association" {
  subnet_id = var.private_app_subnet_az2_id
  route_table_id = aws_route_table.private_route_table_az2.id  
  
}


# associate private data subnet az1 with private route table az1
resource "aws_route_table_association" "private_data_subnet_az1_rt_az1_association" {
  subnet_id = var.private_data_subnet_az1_id 
  route_table_id = aws_route_table.private_route_table_az1.id 
  
}

# associate private data subnet az2 with private route table az2
resource "aws_route_table_association" "private_data_subnet_az1_rt_az2_association" {
  subnet_id = var.private_data_subnet_az2_id 
  route_table_id = aws_route_table.private_route_table_az1.id 
  
}