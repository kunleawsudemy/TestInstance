# variable "AWS_REGION" {
#  default = "us-east-1"
# }

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
 default = "us-east-1"
}

# variable "PATH_TO_PRIVATE_KEY" {
#   default = "ses_key.priv.ppk"
# }

# variable "PATH_TO_PUBLIC_KEY" {
#   default = "ses_key.pub"
# }

variable "vpc_id"{
    default="vpc-0f2915ed752fcc764"
}


variable "ami" {
  default = "ami-0aa7d40eeae50c9a9"
}

variable "instance_type"{
  default ="t2.micro"
}

variable "subnets" {
  type = list(string)
  default=[
    "subnet-0be397f18fe1a5dcb"
   ]
}



