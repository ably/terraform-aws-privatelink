resource "aws_vpc_endpoint" "ably" {
  vpc_id            = var.vpc_id
  service_name      = var.ably_vpc_service_endpoint_name
  vpc_endpoint_type = var.vpc_endpoint_type

  security_group_ids = [
    aws_security_group.vpc_endpoint.id,
  ]

  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "vpc_endpoint" {
  name        = var.vpc_endpoint_sg_name
  description = var.vpc_endpoint_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = var.https_ingress_allowed_ipv4_cidr
    ipv6_cidr_blocks = var.https_ingress_allowed_ipv6_cidr
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = var.http_ingress_allowed_ipv4_cidr
    ipv6_cidr_blocks = var.http_ingress_allowed_ipv6_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.egress_allowed_ipv4_cidr
    ipv6_cidr_blocks = var.egress_allowed_ipv6_cidr
  }

  tags = {
    Name = var.vpc_endpoint_sg_tag_name
  }
}
