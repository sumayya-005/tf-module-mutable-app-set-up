resource "aws_launch_template" "launch-template" {
  name_prefix   = "${var.env}-${var.name}-lt"
  image_id      = data.aws_ami.centos-8-ami.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "bar" {
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }
}