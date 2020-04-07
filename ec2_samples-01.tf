provider "aws" {
  region     = "ap-southeast-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0cbc6aae997c6538a" # Ubuntu 14.04 LTS AMD64 in eu-central-1<br>
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_8088.name}"]
}
# Tạo resource aws_security_group và allow_8088 và khai báo tham chiếu trên resource của aws_instance ${aws_security_group.allow_8088.name}

resource "aws_security_group" "allow_8088" {<br>
  name = "allow_ssh"<br>
  # SSH access<br>
  ingress {<br>
    from_port   = 8088<br>
    to_port     = 8088<br>
    protocol    = "tcp"<br>
    cidr_blocks = ["0.0.0.0/0"]
  }
}
