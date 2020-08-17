resource "aws_cloudwatch_metric_alarm" "disk" {
  alarm_name          = "${ format("ALERTA DISCO SERVIDOR")}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "DiskSpaceUsed"
  namespace           = "AWS/EC2"
  period              = "6"
  statistic           = "Maximum"
  threshold           = "85%"
  alarm_description   = "This metric monitors ec2 disk utilization"
  alarm_actions       = ["${data.aws_sns_topic.alarm.arn}"]

  dimensions = {
    InstanceId = "${aws_instance.instance.id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "disk" {
  alarm_name          = "${ format("ALERTA CPU SERVIDOR")}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPU_Utilization"
  namespace           = "AWS/EC2"
  period              = "6"
  statistic           = "Maximum"
  threshold           = "80%"
  alarm_description   = "This metric monitors ec2 disk utilization"
  alarm_actions       = ["${data.aws_sns_topic.alarm.arn}"]

  dimensions = {
    InstanceId = "${aws_instance.instance.id}"
  }
}