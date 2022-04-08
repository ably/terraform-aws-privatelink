variable "vpc_id" {
  description = "The ID of your VPC"
  type        = string
}

variable "ably_vpc_service_endpoint_name" {
  description = "The VPC Service Endpoint Name. This value will be provided to you by Ably"
  type        = string
}

variable "vpc_endpoint_type" {
  description = "The VPC Endpoint Type. Will always be Interface"
  type        = string
  default     = "Interface"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to create a network interface for the VPC Endpoint"
  type        = list(any)
}

variable "vpc_endpoint_sg_name" {
  description = "Human readable name for the VPC Endpoint Security Group"
  type        = string
  default     = "ably-privatelink-vpc-endpoint-sg"
}

variable "vpc_endpoint_sg_description" {
  description = "Human readable description for the VPC Endpoint Security Group"
  type        = string
  default     = "Ably VPC Endpoint Security Group"
}

variable "https_ingress_allowed_ipv4_cidr" {
  description = "A list of allowed IPV4 CIDRs for HTTPS (Port 443) ingress on the VPC Endpoint"
  type        = list(any)
  default     = []
}

variable "http_ingress_allowed_ipv4_cidr" {
  description = "A list of allowed IPV4 CIDRs for HTTP (Port 80) ingress on the VPC Endpoint"
  type        = list(string)
  default     = []
}

variable "https_ingress_allowed_ipv6_cidr" {
  description = "A list of allowed IPV6 CIDRs for HTTPS (Port 443) ingress on the VPC Endpoint"
  type        = list(string)
  default     = []
}

variable "http_ingress_allowed_ipv6_cidr" {
  description = "A list of allowed IPV6 CIDRs for HTTP (Port 80) ingress on the VPC Endpoint"
  type        = list(string)
  default     = []
}

variable "egress_allowed_ipv4_cidr" {
  description = "A list of allowed IPV4 CIDRs for egress on the VPC Endpoint"
  type        = list(string)
  default     = []
}

variable "egress_allowed_ipv6_cidr" {
  description = "A list of allowed IPV6 CIDRs for egress on the VPC Endpoint"
  type        = list(string)
  default     = []
}

variable "vpc_endpoint_sg_tag_name" {
  description = "Human readable name for your VPC Endpoint Security Group"
  type        = string
  default     = "ably-privatelink-vpc-endpoint-sg"
}
