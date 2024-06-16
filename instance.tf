# bashtiion host"
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.pub.id
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = var.host-name
  }

  connection {
    type        = "ssh"
    user        = var.connection-user
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

}




# private instance 1

resource "aws_instance" "web_private" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = var.private1a
  }

  connection {
    type        = "ssh"
    user        = var.connection-user
    private_key = file("${path.module}/id_rsa")
    host        = self.private_ip

    # Using bastion host as a proxy
    bastion_host        = aws_instance.web.public_ip
    bastion_user        = var.connection-user
    bastion_private_key = file("${path.module}/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install nginx -y",
      "sudo chmod 777 /var/www/html",
      "cd /var/www/html",
      "sudo rm -rf index.nginx-debian.html",
      "wget https://raw.githubusercontent.com/mayaworld13/rolling_update_k8s/main/privatesubnet-1a/index.html"
      
    ]
  }

}



resource "aws_instance" "web_private1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private1b.id
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = var.private1b
  }

  connection {
    type        = "ssh"
    user        = var.connection-user
    private_key = file("${path.module}/id_rsa")
    host        = self.private_ip

    # Using bastion host as a proxy
    bastion_host        = aws_instance.web.public_ip
    bastion_user        = var.connection-user
    bastion_private_key = file("${path.module}/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install nginx -y",
      "sudo chmod 777 /var/www/html",
      "cd /var/www/html",
      "sudo rm -rf index.nginx-debian.html",
      "wget https://raw.githubusercontent.com/mayaworld13/rolling_update_k8s/main/privatesubnet-1b/index.html"
      
    ]
  }

}



