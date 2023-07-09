resource "aws_iam_role" "sre_role" {
  name = "SRE_Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "sre_policy" {
  name        = "SRE_Policy"
  description = "Policy for SRE role"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:ListAllMyBuckets",
        "iam:ListUsers",
        "eks:Describe*",
        "eks:CreateCluster",
        "eks:DeleteCluster"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user" "sre_user" {
  name = "SRE_User"
  path = "/system/"
}

resource "aws_iam_role_policy_attachment" "sre_attach" {
  role       = aws_iam_role.sre_role.name
  policy_arn = aws_iam_policy.sre_policy.arn
}

resource "aws_iam_user_policy_attachment" "sre_user_attach" {
  user       = aws_iam_user.sre_user.name
  policy_arn = aws_iam_policy.sre_policy.arn
}

resource "aws_iam_group" "sre_group" {
  name = "SRE_Group"
}

resource "aws_iam_group_policy_attachment" "sre_group_attach" {
  group      = aws_iam_group.sre_group.name
  policy_arn = aws_iam_policy.sre_policy.arn
}

resource "aws_iam_group_membership" "sre_group_membership" {
  name = "sre_group_membership"

  users = [
    aws_iam_user.sre_user.name
  ]

  group = aws_iam_group.sre_group.name
}
