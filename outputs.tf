output "vpc_endpoint_dns_name" {
  value       = aws_vpc_endpoint.ably.dns_entry[0]["dns_name"]
  description = "DNS Name of your VPC Endpoint"
}

output "vpc_endpoint_dns_hosted_zone_id" {
  value       = aws_vpc_endpoint.ably.dns_entry[0]["hosted_zone_id"]
  description = "The Hosted Zone ID for your VPC Endpoint"
}
