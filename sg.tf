resource "aws_security_group" "project" {
    name = "project"
    description =  "Ingress-rule"  

    tags = {
      name = "Jenkins-SG"
    }

    dynamic "ingress" {
        for_each = var.sg_ports
        content {
          from_port = ingress.value.from
          to_port = ingress.value.to
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

