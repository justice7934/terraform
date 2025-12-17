output "dbaddress" {
  value = aws_db_instance.mydb.address
}

output "dbport" {
  value = aws_db_instance.mydb.port
}

output "dbname" {
  value = aws_db_instance.mydb.db_name
}
