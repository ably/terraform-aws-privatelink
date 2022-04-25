module "ably_privatelink" {
  source                          = "app.terraform.io/ablyrealtime/privatelink/aws"
  version                         = "0.1.0"
  vpc_id                          = "ENTER_VPC_ID"
  ably_vpc_service_endpoint_name  = "ENTER_VPC_SERVICE_ENDPOINT"
  subnet_ids                      = ["ENTER_SUBNET_ID", "ENTER_SUBNET_ID", "ENTER_SUBNET_ID"]
  vpc_endpoint_sg_name            = "privatelink-vpc-endpoint"
  vpc_endpoint_sg_description     = "privatelink-vpc-endpoint"
  https_ingress_allowed_ipv4_cidr = ["ENTER_ALLOWED_IPV4_CIDR"]
  http_ingress_allowed_ipv4_cidr  = ["ENTER_ALLOWED_IPV4_CIDR"]
  https_ingress_allowed_ipv6_cidr = []
  http_ingress_allowed_ipv6_cidr  = []
  egress_allowed_ipv4_cidr        = ["ENTER_ALLOWED_IPV4_CIDR"]
  egress_allowed_ipv6_cidr        = ["ENTER_ALLOWED_IPV6_CIDR"]
}
