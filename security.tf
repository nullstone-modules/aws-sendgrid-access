resource "aws_security_group_rule" "this-smtp-to-world" {
  security_group_id = var.app_metadata["security_group_id"]
  protocol          = "tcp"
  type              = "egress"
  from_port         = 587
  to_port           = 587
  cidr_blocks       = ["0.0.0.0/0"]
}
