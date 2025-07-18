provider "aws" {
  region = "us-east-1" # You can change to your preferred region
}

resource "aws_security_group" "custom_sg" {
  name        = "custom_sg"
  description = "Allow inbound traffic on custom port"

  ingress {
    description = "Custom port access"
    from_port   = var.custom_port
    to_port     = var.custom_port
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

resource "aws_instance" "ubuntu" {
  ami                         = "ami-0c02fb55956c7d316" # Ubuntu 22.04 LTS in us-east-1
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.custom_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "TerraformEC2"
  }
}
