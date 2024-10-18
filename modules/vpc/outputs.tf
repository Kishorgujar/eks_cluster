output "private_sub1_ids" {
  value = aws_subnet.private_sub1[*].id
}

output "private_sub2_ids" {
  value = aws_subnet.private_sub2[*].id
}

output "private_sub3_ids" {
  value = aws_subnet.private_sub3[*].id
}

output "private_sub4_ids" {
  value = aws_subnet.private_sub4[*].id
}

output "public_pub_subnet1_ids" {
  value = aws_subnet.public_pub_sub1[*].id
}

output "public_pub_subnet2_ids" {
  value = aws_subnet.public_pub_sub2[*].id
}

output "vpc_id" {
  value = aws_vpc.public_vpc.id
}

