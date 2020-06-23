resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "networkint" {
  subnet_id   = "${aws_subnet.my_subnet.id}"
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "terraform-workshop1" {
  ami           = "ami-0e342d72b12109f91"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = "${aws_network_interface.networkint.id}"
    device_index         = 0
  }
}