resource "aws_security_group" "db" {
  name        = "db"
  description = "DB access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.app.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.app.cidr_block]
  }
}

resource "aws_security_group" "app" {
  name        = "app"
  description = "App access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.web.cidr_block, aws_subnet.db.cidr_block]
  }
}
