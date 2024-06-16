region             = "us-east-1"
vpc                = "loadbalancer-vpc"
ports              = [22, 80, 443, 3306, 27017, 8000]
tg-name            = "tg-loadbalance"
target_port        = 80
enduserport        = "8000"
tg_protocol        = "HTTP"
load_balancer-name = "alb-webapp"
elb-type           = "application"
Environment        = "production"
ami                = "ami-04b70fa74e45c3917"
instance_type      = "t2.micro"
key_name           = "fjdak"
host-name          = "Bashtion-host"
private1a          = "privatesubnet_1a"
private1b          = "privatesubnet_1b"
connection-user    = "ubuntu"