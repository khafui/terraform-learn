/*  create security group - web traffic */

resource "aws_security_group" "web-traffic" {
  name        = "Allow HTTPS"
  /* description = "opening custom ports" */

  dynamic "ingress" {
    #iterator is a loop
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    /* description = "Allow all ip and ports outbound" */
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "vpc-ssh"
  }
}
