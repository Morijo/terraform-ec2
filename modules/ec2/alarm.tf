resource "aws_cloudwatch_metric_alarm" "cw_cpu" {
  alarm_name                = "cpu-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "60"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  dimensions = {
    InstanceId = aws_instance.this.id
  }
}

resource "aws_cloudwatch_metric_alarm" "cw_memory" {
  alarm_name = "memory-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name = "mem_used_percent"
  namespace = "CWAgent"
  period = "120"
  statistic = "Average"
  threshold = "80"
  alarm_description = "This metric monitors ec2 memory utilization"
  insufficient_data_actions = []
  dimensions = {
    InstanceId = aws_instance.this.id
    ImageId = data.aws_ami.this.id
    InstanceType = "t2.micro"
  }
}

resource "aws_cloudwatch_metric_alarm" "cw_disk" {
  alarm_name = "disk-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name = "disk_used_percent"
  namespace = "CWAgent"
  period = "120"
  statistic = "Average"
  threshold = "80"
  alarm_description = "This metric monitors ec2 disk utilization"
  insufficient_data_actions = []
  dimensions = {
    path = "/"
    InstanceId = aws_instance.this.id
    ImageId = data.aws_ami.this.id
    InstanceType = "t2.micro"
    device = "xvda1"
    fstype = "ext4"
  }
}