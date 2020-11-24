resource "null_resource" "remote" {
 triggers {
     always_run = "${timestamp()}"
 }


provisioner "remote-exec" {
    connection {
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
        host = "${aws_instance.test.public_ip}"
    }

   inline = [
            "sudo yum install httpd -y",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd",
            "sudo yum install wget -y",
            "sudo yum install unzip -y",
            "cd /var/www/html",
            "sudo wget https://wordpress.org/latest.zip",
            "sudo unzip latest.zip",
            "sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y",
            " sudo yum-config-manager --enable remi-php72 -y",
	        "sudo yum install php php-mysql -y",
            "sudo mv -f /var/www/html/wordpress/* /var/www/html/",
            "sudo systemctl restart httpd"
           
            
 ]
    
}
}