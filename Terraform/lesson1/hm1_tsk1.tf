provider "aws" {

}

data "aws_vpc" "foo" {
  tags = {
    Name = "my-vpc-ep"
  }
}

output "foo" {
  value = data.aws_vpc.foo.cidr_block_associations[0].cidr_block
}

data "aws_security_groups" "groups_sec" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

output "security_groups" {
  description = "AWS SEC Groups ID"
  value       = data.aws_security_groups.groups_sec.ids
}
