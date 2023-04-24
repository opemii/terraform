resource "aws_instance" "web" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  key_name = "key2"
  subnet_id = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.websg.id]
  associate_public_ip_address = true
  count = 2
  user_data                   = "${file("data.sh")}"
  tags = {
    Name = "WebServer-${count.index}"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  key_name = "key2"
  subnet_id = aws_subnet.private_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.appsg.id]
  
  count = 2
  user_data                   = "${file("data.sh")}"
  tags = {
    Name = "AppServer-${count.index}"
  }
}