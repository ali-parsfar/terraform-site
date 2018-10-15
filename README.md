

# terraform-site
build a site in aws with terrform

##########################################################################################
alireza@alireza-HP-EliteBook-8460p:~/telstra-test/terraform-site$ terraform apply
var.aws_access_key_id
  Enter a value: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA   

var.aws_secret_access_key
  Enter a value: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

var.bucket_name
  Enter a value: CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

aws_iam_role.ec2-role: Refreshing state... (ID: ec2-role)
aws_iam_instance_profile.ec2-role: Refreshing state... (ID: ec2-role)
aws_iam_role_policy.ec2-role-policy: Refreshing state... (ID: ec2-role:ec2-role-policy)
aws_launch_configuration.Free-Tire-Amazon-Linux-2018: Refreshing state... (ID: Free-Tire-Amazon-Linux-201820181015180824838700000001)
aws_autoscaling_group.terrafor-autoscaling-grp: Refreshing state... (ID: tf-asg-20181015180825744500000002)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_autoscaling_group.terrafor-autoscaling-grp
      id:                                                       <computed>
      arn:                                                      <computed>
      availability_zones.#:                                     "1"
      availability_zones.3148583350:                            "ap-southeast-2a"
      default_cooldown:                                         <computed>
      desired_capacity:                                         "1"
      force_delete:                                             "false"
      health_check_grace_period:                                "300"
      health_check_type:                                        <computed>
      initial_lifecycle_hook.#:                                 "1"
      initial_lifecycle_hook.816006999.default_result:          "CONTINUE"
      initial_lifecycle_hook.816006999.heartbeat_timeout:       "2000"
      initial_lifecycle_hook.816006999.lifecycle_transition:    "autoscaling:EC2_INSTANCE_LAUNCHING"
      initial_lifecycle_hook.816006999.name:                    "ec2-instance-initial"
      initial_lifecycle_hook.816006999.notification_metadata:   ""
      initial_lifecycle_hook.816006999.notification_target_arn: ""
      initial_lifecycle_hook.816006999.role_arn:                ""
      launch_configuration:                                     "${aws_launch_configuration.Free-Tire-Amazon-Linux-2018.name}"
      load_balancers.#:                                         <computed>
      max_size:                                                 "2"
      metrics_granularity:                                      "1Minute"
      min_size:                                                 "1"
      name:                                                     <computed>
      protect_from_scale_in:                                    "true"
      service_linked_role_arn:                                  <computed>
      target_group_arns.#:                                      <computed>
      vpc_zone_identifier.#:                                    <computed>
      wait_for_capacity_timeout:                                "10m"

  + aws_launch_configuration.Free-Tire-Amazon-Linux-2018
      id:                                                       <computed>
      associate_public_ip_address:                              "false"
      ebs_block_device.#:                                       <computed>
      ebs_optimized:                                            <computed>
      enable_monitoring:                                        "true"
      iam_instance_profile:                                     "ec2-role"
      image_id:                                                 "ami-09b42976632b27e9b"
      instance_type:                                            "t2.micro"
      key_name:                                                 "MyEC2KeyPair"
      name:                                                     <computed>
      name_prefix:                                              "Free-Tire-Amazon-Linux-2018"
      root_block_device.#:                                      <computed>
      user_data:                                                "34c7df5a2daf2cb5eb2140bea667bda07daec9e7"


Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_launch_configuration.Free-Tire-Amazon-Linux-2018: Creating...
  associate_public_ip_address: "" => "false"
  ebs_block_device.#:          "" => "<computed>"
  ebs_optimized:               "" => "<computed>"
  enable_monitoring:           "" => "true"
  iam_instance_profile:        "" => "ec2-role"
  image_id:                    "" => "ami-09b42976632b27e9b"
  instance_type:               "" => "t2.micro"
  key_name:                    "" => "MyEC2KeyPair"
  name:                        "" => "<computed>"
  name_prefix:                 "" => "Free-Tire-Amazon-Linux-2018"
  root_block_device.#:         "" => "<computed>"
  user_data:                   "" => "34c7df5a2daf2cb5eb2140bea667bda07daec9e7"
aws_launch_configuration.Free-Tire-Amazon-Linux-2018: Creation complete after 0s (ID: Free-Tire-Amazon-Linux-201820181015182313768400000001)
aws_autoscaling_group.terrafor-autoscaling-grp: Creating...
  arn:                                                      "" => "<computed>"
  availability_zones.#:                                     "" => "1"
  availability_zones.3148583350:                            "" => "ap-southeast-2a"
  default_cooldown:                                         "" => "<computed>"
  desired_capacity:                                         "" => "1"
  force_delete:                                             "" => "false"
  health_check_grace_period:                                "" => "300"
  health_check_type:                                        "" => "<computed>"
  initial_lifecycle_hook.#:                                 "" => "1"
  initial_lifecycle_hook.816006999.default_result:          "" => "CONTINUE"
  initial_lifecycle_hook.816006999.heartbeat_timeout:       "" => "2000"
  initial_lifecycle_hook.816006999.lifecycle_transition:    "" => "autoscaling:EC2_INSTANCE_LAUNCHING"
  initial_lifecycle_hook.816006999.name:                    "" => "ec2-instance-initial"
  initial_lifecycle_hook.816006999.notification_metadata:   "" => ""
  initial_lifecycle_hook.816006999.notification_target_arn: "" => ""
  initial_lifecycle_hook.816006999.role_arn:                "" => ""
  launch_configuration:                                     "" => "Free-Tire-Amazon-Linux-201820181015182313768400000001"
  load_balancers.#:                                         "" => "<computed>"
  max_size:                                                 "" => "2"
  metrics_granularity:                                      "" => "1Minute"
  min_size:                                                 "" => "1"
  name:                                                     "" => "<computed>"
  protect_from_scale_in:                                    "" => "true"
  service_linked_role_arn:                                  "" => "<computed>"
  target_group_arns.#:                                      "" => "<computed>"
  vpc_zone_identifier.#:                                    "" => "<computed>"
  wait_for_capacity_timeout:                                "" => "10m"
aws_autoscaling_group.terrafor-autoscaling-grp: Still creating... (10s elapsed)
aws_autoscaling_group.terrafor-autoscaling-grp: Still creating... (20s elapsed)
aws_autoscaling_group.terrafor-autoscaling-grp: Still creating... (30s elapsed)
aws_autoscaling_group.terrafor-autoscaling-gr