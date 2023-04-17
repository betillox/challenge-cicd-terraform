# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  security_groups= "jenkins-scg"
  tags= {
    Name = var.tag_name
  }
}

