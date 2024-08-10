resource "aws_instance" "web" {
  ami           = "ami-023f7a277d992156c" # Update with the latest Ubuntu AMI ID
  instance_type = "t2.micro"

  user_data = file("bootstrap.sh")

  tags = {
    Name = "static-web-instance"
  }

  # Add a security group to allow HTTP access
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
