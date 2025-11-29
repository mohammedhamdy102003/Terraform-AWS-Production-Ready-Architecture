output "vpc_id" {
    value = aws_vpc.main.id
}
output "public_subnet_ids" {
    value = [
        aws_subnet.public_subnet_a.id,
        aws_subnet.public_subnet_b.id
    ]
}
output "private_subnet_ids" {
    value = [
        aws_subnet.private_subnet_a.id,
        aws_subnet.private_subnet_b.id
    ]
}
output "internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}
output "public_route_table_id" {
    value = aws_route_table.public_route_table.id
}
output "nat_gateway_ids" {
    value = aws_nat_gateway.nat.*.id
}
output "private_route_table_id" {
    value = aws_route_table.private_route_table.id
}
