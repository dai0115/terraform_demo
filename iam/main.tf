provider "aws" {
  region = var.region
}

resource "aws_iam_user" "myuser" {
  name = "Myname1"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "ec2:CreateIpamPool",
                "ec2:ResetInstanceAttribute",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:ModifyVpnConnectionOptions",
                "ec2:ReleaseIpamPoolAllocation",
                "ec2:CreateCoipPoolPermission",
                "ec2:DeleteNetworkInsightsAnalysis",
                "ec2:UnassignPrivateIpAddresses",
                "ec2:DisableImageDeprecation",
                "ec2:DeleteLocalGatewayRouteTable",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:CancelCapacityReservationFleets",
                "ec2:CreateVerifiedAccessEndpoint",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:ModifyInstanceMaintenanceOptions",
                "ec2:DeleteNatGateway",
                "ec2:CancelCapacityReservation",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "ec2:ModifyVpcEndpoint",
                "ec2:ModifyInstanceCapacityReservationAttributes",
                "ec2:CreatePublicIpv4Pool",
                "ec2:DeleteSpotDatafeedSubscription",
                "ec2:ImportVolume",
                "ec2:CreateVerifiedAccessGroup",
                "ec2:ModifyFleet",
                "ec2:DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
                "ec2:RequestSpotFleet",
                "ec2:CreateSubnetCidrReservation",
                "ec2:DeleteTransitGatewayMulticastDomain",
                "ec2:DeleteVerifiedAccessInstance",
                "ec2:ModifyReservedInstances",
                "ec2:ReleaseAddress",
                "ec2:CreateTrafficMirrorTarget",
                "ec2:ModifyTrafficMirrorFilterRule",
                "ec2:CreateClientVpnRoute",
                "ec2:CreateLocalGatewayRoute",
                "ec2:CreateFleet",
                "ec2:ModifyHosts",
                "ec2:ProvisionIpamPoolCidr",
                "ec2:DeleteLocalGatewayRoute",
                "ec2:ResetFpgaImageAttribute"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.myuser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}