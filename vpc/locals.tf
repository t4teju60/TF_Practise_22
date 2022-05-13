locals {
    subnets = [ "web1", "web2", "App1", "App2", "db1", "db2"]
    igw_myvpc_igw = "myvpc_igw"
    anywhere = "0.0.0.0/0"
}


#Diff b/w local vars and normal vars
#1. local variable can't be passed from outside, only values can be here
#2. normal vars can be passed - ex: $terraform apply -var "vpc_cidr=10.0.0.0/16"



