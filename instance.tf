resource "aws_instance" "test" {
    ami = "${data.aws_ami.centos.id}"
    instance_type = "${var.instance_type}"
    key_name = "${aws_key_pair.key.key_name}"
    availability_zone = "${var.availability_zone}"
    subnet_id = "${aws_subnet.subnet101.id}"
    vpc_security_group_ids = ["${aws_security_group.vpc_task.id}"]
}

resource "aws_instance" "test2" {
    ami = "${data.aws_ami.centos.id}"
    instance_type = "${var.instance_type}"
    key_name = "${aws_key_pair.key.key_name}"
    availability_zone = "${var.availability_zone}"
    subnet_id = "${aws_subnet.subnet1.id}"
    vpc_security_group_ids = ["${aws_security_group.vpc_task.id}"]


    
}