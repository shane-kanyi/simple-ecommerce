provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow all necessary traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9100
    to_port     = 9100
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

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.app_sg.name]

  # For a real project, you should associate an SSH key pair.
  # key_name = "your-aws-key-pair-name"

  user_data = <<-EOF
              #!/bin/bash
              # Redirect all output to a log file for debugging
              exec &> /var/log/user-data.log

              echo "Updating all packages"
              sudo yum update -y

              # THE FIX IS HERE: Use 'dnf' for Amazon Linux 2023 instead of 'amazon-linux-extras'
              echo "Installing Docker on AL2023"
              sudo dnf install docker -y

              echo "Starting Docker service"
              sudo service docker start

              echo "Adding ec2-user to the docker group"
              sudo usermod -a -G docker ec2-user

              echo "Installing Docker Compose"
              sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose

              echo "User data script finished"
              EOF

  tags = { Name = "E-commerce App Server" }
}