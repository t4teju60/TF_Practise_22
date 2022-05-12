# variable "subnets" {
#     type = list(string)
#     default = ["App1", "App2", "App3", "App4","App5","App6"]
#     description = "Name of subnets"
# }

variable "cidr_ranges" {
    type = list(string)
    default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]
    description = "cidr ranges for all subnets"
}

variable "availaibility_zones" {
    type = list(string)
    default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}

variable "region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}
