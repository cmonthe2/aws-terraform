
resource "aws_db_subnet_group" "db_sub_group" {
  name       = "rds-private-db-subnet"
  subnet_ids = ["${var.rds_subnet1}", "${var.rds_subnet2}"]
}