variable "instance_type" {
    type = string
}

variable "sg_ports" {
    description = "list of ingress"
    type = list(object({
    from = number
    to   = number
  }))
  default = [
    { from = 30000, to = 32767 },
    { from = 80,    to = 80 },
    { from = 6379,  to = 6379 },
    { from = 443,   to = 443 },
    { from = 465,   to = 465 },
    { from = 3000,  to = 10000 },
    { from = 22,    to = 22 },
    { from = 25,    to = 25 },
    { from = 6443,  to = 6443 },
  ]
}


variable "aws_region"{}