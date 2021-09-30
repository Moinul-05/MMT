variable "region" {
    type = string  
}

variable "instance_type" {
    type = string
}

variable "availability_zone" {
    type = string
}

variable "ami" {
    type = map(any)
    default = {
        "eu-west-2" : "ami-0dbec48abfe298cab"
    }
  
}