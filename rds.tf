# Creating RDS Instance
resource "aws_db_subnet_group" "db-group" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]
  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "db-group" {
  allocated_storage    = 10
  db_subnet_group_name = aws_db_subnet_group.db-group.id
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t2.micro"
  #multi_az               = true
  username               = "admin"
  password               = "chasermca40"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}
