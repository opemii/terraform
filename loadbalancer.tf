resource "aws_lb" "weblb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  #subnets            = ["${aws_subnet.public_subnet.*.id}"]
  subnets            = [for subnet in aws_subnet.public_subnet : subnet.id]
  #subnets            = [ aws_subnet.public_subnet.*.id]
}

//Target Group
resource "aws_lb_target_group" "web_lb_target" {
  name     = "weblb-targetgroup"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.myvpc.id

  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = "/"    
    port                = 80  
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.web_lb_target.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
  count = 2
}

//Listener
resource "aws_lb_listener" "web_lb_listener" {
  load_balancer_arn = aws_lb.weblb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_lb_target.arn
  }
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = "${aws_lb.weblb.dns_name}"
}
