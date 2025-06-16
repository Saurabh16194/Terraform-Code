#IAM Instance Profile: Binds the role to an EC2 instance
resource "aws_iam_instance_profile" "jenkins_profile" {
    name = "Jenkins_instance_profile"
    role = aws_iam_role.jenkins_role.name
}