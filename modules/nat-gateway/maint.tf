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
    subnet_id =  

    tags = {
      Nmae = "${var.project_name}-${var.environment}-ep1"
    }
  
}