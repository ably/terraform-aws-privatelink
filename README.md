# Ably Privatelink Connections

Use this module to configure private inter-VPC communication with Ably using AWS PrivateLink. 

**NOTE:** You need an active Ably account and will need to engage with Ably's SRE team to make use of this module.

For PrivateLink documentation, see [AWS PrivateLink](https://aws.amazon.com/privatelink)

## Usage

```terraform
module "ably_privatelink" {
  source                          = "ably/terraform-aws-privatelink"
  version                         = "0.0.1"
  vpc_id                          = "vpc_id"
  ably_vpc_service_endpoint_name  = "vpc_service_endpoint"
  subnet_ids                      = ['subnet_id']
  vpc_endpoint_sg_name            = "ably-privatelink-vpc-endpoint-sg"
  vpc_endpoint_sg_description     = "Ably PrivateLink VPC Endpoint SG"
  https_ingress_allowed_ipv4_cidr = ["10.0.0.0/8"]
  http_ingress_allowed_ipv4_cidr  = ["10.0.0.0/8"]
  https_ingress_allowed_ipv6_cidr = []
  http_ingress_allowed_ipv6_cidr  = []
  egress_allowed_ipv4_cidr        = ["0.0.0.0/0"]
  egress_allowed_ipv6_cidr        = ["::/0"]
}
```

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.20 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.20 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ably\_vpc\_service\_endpoint\_name | The VPC Service Endpoint Name. This value will be provided to you by Ably | `string` | n/a | yes |
| egress\_allowed\_ipv4\_cidr | A list of allowed IPV4 CIDRs for egress on the VPC Endpoint | `list(string)` | `[]` | no |
| egress\_allowed\_ipv6\_cidr | A list of allowed IPV6 CIDRs for egress on the VPC Endpoint | `list(string)` | `[]` | no |
| http\_ingress\_allowed\_ipv4\_cidr | A list of allowed IPV4 CIDRs for HTTP (Port 80) ingress on the VPC Endpoint | `list(string)` | `[]` | no |
| http\_ingress\_allowed\_ipv6\_cidr | A list of allowed IPV6 CIDRs for HTTP (Port 80) ingress on the VPC Endpoint | `list(string)` | `[]` | no |
| https\_ingress\_allowed\_ipv4\_cidr | A list of allowed IPV4 CIDRs for HTTPS (Port 443) ingress on the VPC Endpoint | `list(any)` | `[]` | no |
| https\_ingress\_allowed\_ipv6\_cidr | A list of allowed IPV6 CIDRs for HTTPS (Port 443) ingress on the VPC Endpoint | `list(string)` | `[]` | no |
| subnet\_ids | A list of subnet IDs to create a network interface for the VPC Endpoint | `list(any)` | n/a | yes |
| vpc\_endpoint\_sg\_description | Human readable description for the VPC Endpoint Security Group | `string` | `"Ably VPC Endpoint Security Group"` | no |
| vpc\_endpoint\_sg\_name | Human readable name for the VPC Endpoint Security Group | `string` | `"ably-privatelink-vpc-endpoint-sg"` | no |
| vpc\_endpoint\_sg\_tag\_name | Human readable name for your VPC Endpoint Security Group | `string` | `"ably-privatelink-vpc-endpoint-sg"` | no |
| vpc\_endpoint\_type | The VPC Endpoint Type. Will always be Interface | `string` | `"Interface"` | no |
| vpc\_id | The ID of your VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_endpoint\_dns\_hosted\_zone\_id | The Hosted Zone ID for your VPC Endpoint |
| vpc\_endpoint\_dns\_name | DNS Name of your VPC Endpoint |

