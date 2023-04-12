resource "aws_instance" "ec2-scg" {
  ami           = "ami-06e46074ae430fba6"  # replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my_keypair"                # replace with your SSH key name

  vpc_security_group_ids = [aws_security_group.demo-sg.id]

  tags = {
    Name = "ec2-terraform"
  }
}

