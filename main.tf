provider "aws" {
  region = "us-east-1"
#   access_key = "AKIARDIRSBQ4WSHVQMHZ"
#   secret_key = "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"
}

resource "aws_s3_bucket" "my_s3_bucket"{
    bucket = "heltes11thmay2323"

}