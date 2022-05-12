provider "aws" {
    # region = "us-east-1"
    region = var.region
    shared_credentials_files = ["/Users/tejesh.karri/.aws/credentails"]
}