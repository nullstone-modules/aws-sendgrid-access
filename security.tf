resource "aws_security_group" "this" {
  name   = local.resource_name
  vpc_id = local.vpc_id
  tags   = merge(local.tags, { Name = local.resource_name })
}

resource "aws_security_group_rule" "this-smtp-to-world" {
  security_group_id = var.app_metadata["security_group_id"]
  protocol          = "tcp"
  type              = "egress"
  from_port         = 587
  to_port           = 587
  cidr_blocks       = ["0.0.0.0/0"]
}
