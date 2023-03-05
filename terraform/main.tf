provider "aws" {
  region = var.region
}

resource "aws_security_group" "sg-Leumi" {
  name_prefix = "apache-sg"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["91.231.246.50/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "Leumi-1" {
  ami = "ami-0c0933ae5caf0f5f9"
  instance_type = "t2.micro"
  key_name = "My-Leumi"
  security_groups = [aws_security_group.sg-Leumi.id]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF
  tags = {
    Name = "Leumi-instance"
  }
}