# variable "AWS_REGION" {
#  default = "us-east-1"
# }

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
 default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ses_key.priv.ppk"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ses_key.pub"
}

variable "vpc_id"{
    default="vpc-03130262f33fa1472"
}


variable "ami" {
  default = "ami-0b5eea76982371e91"
}

variable "instance_type"{
  default ="t2.micro"
}

variable "subnets" {
  type = list(string)
  default=[
    "subnet-0a1cb54bd3d2c30d2"
   ]
}



