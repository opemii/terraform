resource "aws_route_table" "pubrt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
    tags = {
        Name = "web_custom_routetable"
    }
}

resource "aws_route_table_association" "public_route"{
    subnet_id = aws_subnet.public_subnet[count.index].id
    route_table_id = aws_route_table.pubrt.id
    count = 2
}

resource "aws_route_table" "privrt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.mynat.id
    }
    tags = {
        Name = "app_custom_routetable"
    }
}

resource "aws_route_table_association" "private_route"{
    subnet_id = aws_subnet.private_subnet[count.index].id
    route_table_id = aws_route_table.privrt.id
    count = 2
}

resource "aws_route_table" "dbrt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.mynat.id
    }
    tags = {
        Name = "db_custom_routetable"
    }
}

resource "aws_route_table_association" "db_route"{
    subnet_id = aws_subnet.db_subnet[count.index].id
    route_table_id = aws_route_table.dbrt.id
    count = 2
}

#resource "aws_default_route_table" "default_rt" {
#  default_route_table_id = aws_vpc.myvpc.default_route_table_id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_nat_gateway.mynat.id
#  }
#  tags = {
#    Name = "custom_default_rt"
#  }
#}