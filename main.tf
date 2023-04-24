resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "myvpc"
    }
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "igw"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_cidr[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true
    count = 2
    tags = {
        Name = "web-${count.index}"
    }
  
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.private_cidr[count.index]
    availability_zone = var.azs[count.index]
    count = 2
    tags = {
        Name = "app-${count.index}"
    }
  
}
resource "aws_subnet" "db_subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.db_cidr[count.index]
    availability_zone = var.azs[count.index]
    count = 2
    tags = {
        Name = "db-${count.index}"
    }
  
}

resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.myigw]
}


resource "aws_eip" "myeip" {
  vpc      = true
}

