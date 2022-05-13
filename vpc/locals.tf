locals {
    subnets = ["App1", "App2", "App3", "App4","App5","App6"]
    igw_myvpc_igw = "myvpc_igw"
}


#Diff b/w local vars and normal vars
#1. local variable can't be passed from outside, only values can be here
#2. normal vars can be passed - ex: $terraform apply -var "vpc_cidr=10.0.0.0/16"



