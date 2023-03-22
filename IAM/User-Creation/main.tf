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


## user managed policy attached to user

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.newuser.name]
  policy_arn = aws_iam_policy.ec2fullaccess.arn
}


###aws managed policy attached to user

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.newuser.name]
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])
  policy_arn = each.value
}


