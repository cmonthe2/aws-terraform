resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

##user in datasource file added to the developer group
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
   data.aws_iam_user.example.user_name,
  ]

  group = aws_iam_group.developers.name
}

##set permission to the developer group

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53ReadOnlyAccess"
}
