resource "aws_instance" "d-s-p" {
  ami           = "ami-04823729c75214919"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-0edc7c00d609e6400"]
  key_name = ""
  user_data_base64 = base64encode(<<EOF
    #!/bin/bash
# Tomcat Server Installation
sudo su
amazon-linux-extras install tomcat8.5 -y
systemctl enable tomcat
systemctl start tomcat

# Provisioning Ansible Deployer Access
useradd ansibleadmin
echo ansibleadmin | passwd ansibleadmin --stdin
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo "ansibleadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# : <<'END'
# # Tomcat Server Installation
# sudo su
# amazon-linux-extras install tomcat8.5 -y
# systemctl enable tomcat
# systemctl start tomcat

# # Provisioning Ansible Deployer Access
# useradd ansibleadmin
# echo ansibleadmin | passwd ansibleadmin --stdin
# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# systemctl restart sshd
# echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# END

    EOF
  )
  

  tags = {
    Name = "d-s-p"
  }
}
