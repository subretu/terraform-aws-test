# subnet
## public
resource "aws_subnet" "public-web" {
    vpc_id = "${VPC.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "public-web"
    }
}

## praivate
resource "aws_subnet" "private-db1" {
    vpc_id = "${VPC.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "private-db1"
    }
}

resource "aws_subnet" "private-db2" {
    vpc_id = "${VPC.id}"
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-1c"
    tags = {
      Name = "private-db2"
    }
}