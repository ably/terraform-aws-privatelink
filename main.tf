/**
* # [Ably](https://www.ably.io)
*
* _[Ably](https://ably.com) is the platform that powers synchronized digital experiences in realtime. Whether attending an event in a virtual venue, receiving realtime financial information, or monitoring live car performance data – consumers simply expect realtime digital experiences as standard. Ably provides a suite of APIs to build, extend, and deliver powerful digital experiences in realtime for more than 250 million devices across 80 countries each month. Organizations like Bloomberg, HubSpot, Verizon, and Hopin depend on Ably’s platform to offload the growing complexity of business-critical realtime data synchronization at global scale. For more information, see the [Ably documentation](https://ably.com/documentation)._
*
* # Ably Privatelink Connections
*
* Use this module to configure private inter-VPC communication with Ably using AWS PrivateLink.
*
* **NOTE:** You need an active Ably account and will need to engage with Ably's SRE team to make use of this module.
*
* For PrivateLink documentation, see [AWS PrivateLink](https://aws.amazon.com/privatelink)
*
* ## Pre-requisites
*
* Before you can use this module, you will need to go through some setup with your Ably account manager. This includes providing the IDs of the AWS accounts you expect to make PrivateLink connections from, and agreeing which AWS regions and availability zones you will ll be connecting from. Once you have completed that setup, you will then need to create VPCs and subnets in those availability zones, and pass their IDs to the module as Terraform variables vpc_id and subnet_ids.
*
* ## Infrastructure created by this module
*
* This module will provision the following infrastructure:
*
* - VPC Endpoint (Type = Interface) (Includes IP address per subnet/AZ specified)
* - VPC Endpoint Security Group
* - VPC Endpoint Security Group Rules (to allow HTTP and HTTPS traffic)
*
* ## Verifying that your VPC Endpoint is responding to requests
*
* Once you have successfully applied the module, you can verify that the VPC endpoint is working correctly by running the following curl command from within your VPC.
*
* ```bash
* curl -Iv http://{Your VPC Endpoint IP}/health.
* ```
* You should receive an HTTP 200 status code with the body of the response containing the phrase 'Ably Up'.
*
* Documentation on troubleshooting AWS Interface VPC endpoints can be found here - [Troubleshooting Interface VPC Endpoints](https://aws.amazon.com/premiumsupport/knowledge-center/connect-endpoint-service-vpc/).
*
* ## Usage
*
* ```terraform
* module "ably_privatelink" {
*   source                          = "ably/terraform-aws-privatelink"
*   version                         = "0.0.1"
*   vpc_id                          = "vpc_id"
*   ably_vpc_service_endpoint_name  = "vpc_service_endpoint"
*   subnet_ids                      = ['subnet_id']
*   vpc_endpoint_sg_name            = "ably-privatelink-vpc-endpoint-sg"
*   vpc_endpoint_sg_description     = "Ably PrivateLink VPC Endpoint SG"
*   https_ingress_allowed_ipv4_cidr = ["10.0.0.0/8"]
*   http_ingress_allowed_ipv4_cidr  = ["10.0.0.0/8"]
*   https_ingress_allowed_ipv6_cidr = []
*   http_ingress_allowed_ipv6_cidr  = []
*   egress_allowed_ipv4_cidr        = ["0.0.0.0/0"]
*   egress_allowed_ipv6_cidr        = ["::/0"]
* }
* ```
*
* ## Support, feedback and troubleshooting
*
* Please visit http://support.ably.io/ for access to our knowledgebase and to ask for any assistance.
*
* You can also view the community reported Github issues.
*
* ## Contributing
*
* For guidance on how to contribute to this project, see [CONTRIBUTING.md](CONTRIBUTING.md).
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.17"
    }
  }
}
