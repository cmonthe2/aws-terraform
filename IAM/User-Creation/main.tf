resource "aws_iam_user" "newuser" {
  name = var.name
}

##console access to the user

resource "aws_iam_user_login_profile" "login" {
 user    = aws_iam_user.newuser.name
 password_length = 8
 password_reset_required = true
}

output "password" {
 value = aws_iam_user_login_profile.login.password
}


##policy attached to user

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.newuser.name]
  policy_arn = aws_iam_policy.ec2fullaccess.arn
}
