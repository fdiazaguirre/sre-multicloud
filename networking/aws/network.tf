resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = local.vpc_name
  }
}

resource "aws_subnet" "web-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "web"
  }
}

resource "aws_subnet" "web-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "web"
  }
}

resource "aws_subnet" "app-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "app"
  }
}

resource "aws_subnet" "app-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "app"
  }
}

resource "aws_subnet" "db-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.14.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "db"
  }
}

resource "aws_subnet" "db-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.15.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "db"
  }
}
