# vpc
resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

# subnet
## public
resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "public-1"
    }
}

## praivate
resource "aws_subnet" "private-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "private-1"
    }
}

resource "aws_subnet" "private-2" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-1c"
    tags = {
      Name = "private-2"
    }
}