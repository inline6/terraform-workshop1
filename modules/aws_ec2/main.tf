# EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0e342d72b12109f91"
  instance_type = "t2.micro"
  security_groups = aws_security_group.allow_tls

  tags = {
    Name = "Terraform-workshop"
    }
}

# Security group for AWS instance
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}