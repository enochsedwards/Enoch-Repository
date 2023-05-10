output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub-sub-1" {
  value = aws_subnet.pub-sub-1.id
}

output "pub-sub-2" {
  value = aws_subnet.pub-sub-2.id
}

output "priv-sub-1" {
  value = aws_subnet.priv-sub-1.id
}

output "priv-sub-2" {
  value = aws_subnet.priv-sub-2.id
}

output "nat-gateway-id" {
value = aws_nat_gateway.nat-gateway.id
}

output "internet-gateway-id" {
value = aws_internet_gateway.internet-gateway.id
}

output "elastic-eip-id" {
value = aws_eip.elastic-eip.id
}
