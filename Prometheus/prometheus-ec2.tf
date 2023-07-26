resource "aws_instance" "prometheus" {
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t2.medium"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0251f7d42cb95fb97"]
  key_name = ""
  
  tags = {
    Name = "prometheus"
  }
}