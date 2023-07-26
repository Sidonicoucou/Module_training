resource "aws_instance" "Grafana" {
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t2.medium"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0c493b3dc133a3856"]
  key_name = ""
  tags = {
    Name = "grafana"
  }
}