# Generate local private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "${path.module}/ec2-key.pem"
  file_permission = "0400"
}

# Register public key in AWS
resource "aws_key_pair" "generated_key" {
  key_name   = "ec2-key-generated"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "aws_instance" "web" {
    ami = data.aws_ami.jenkins.id
    instance_type = var.instance_type
    security_groups = [aws_security_group.project.id]
    key_name = aws_key_pair.generated_key.key_name
    iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
    root_block_device {
    volume_size = 30
  }
    tags = {
        name = "Jenkins-Machine"
    }
}

