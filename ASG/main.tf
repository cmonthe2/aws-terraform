  
  #launch config 
  resource "aws_launch_configuration" "launch-config" {
  name = "harshal-lc"  
  image_id        = "ami-04581fbf744a7d11f" //amazon linux 2   
  instance_type   = "t2.micro"
  security_groups = ["${var.vpc_security_group_ids}"]
  key_name = "demo"
  user_data = <<-EOF
              #!/bin/bash
              yum -y install httpd
              echo "Hello, harshal kathar" > /var/www/html/index.html
              service httpd start
              chkconfig httpd on
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.launch-config.name}"
  vpc_zone_identifier  = [
    "${var.subnet1}",
    "${var.subnet2}",
  ]
  min_size = 2
  max_size = 4   
  lifecycle {
    create_before_destroy = true
  }

}

//autoscaling plan

resource "aws_autoscalingplans_scaling_plan" "example" {
  name = "example-dynamic-cost-optimization"

  application_source {
    tag_filter {
      key    = "application"
      values = ["example"]
    }
  }

  scaling_instruction {
    max_capacity       = 3
    min_capacity       = 1
    resource_id        = format("autoScalingGroup/%s", aws_autoscaling_group.bar.name)
    scalable_dimension = "autoscaling:autoScalingGroup:DesiredCapacity"
    service_namespace  = "autoscaling"

    target_tracking_configuration {
      predefined_scaling_metric_specification {
        predefined_scaling_metric_type = "ASGAverageCPUUtilization"
      }

      target_value = 70
    }
  }
}

