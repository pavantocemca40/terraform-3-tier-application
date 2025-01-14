# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                         = "ami-0d473344347276854"
  instance_type               = "t2.micro"
  key_name                    = "cloud"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = aws_subnet.demoinstance.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance"
  }
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demoinstance1" {
  ami                         = "ami-0d473344347276854"
  instance_type               = "t2.micro"
  key_name                    = "cloud"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = aws_subnet.demoinstance.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance 2"
  }
}
