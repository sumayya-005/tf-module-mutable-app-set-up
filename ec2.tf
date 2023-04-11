resource "aws_launch_template" "launch-template" {
  name_prefix   = "${var.env}-${var.name}-lt"
  image_id      = data.aws_ami.centos-8-ami.image_id
  instance_type = var.instance_type
}