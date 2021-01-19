provider "aws" {

  region  = "us-east-1"
  alias   = "a-role"
  profile = "arole"
  assume_role {
    role_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/a-role"
    session_name = "Assume_Role"
  }

}

resource "aws_iam_user" "assume-user" {
  name     = "assume-user"
  path     = "/system/"
  provider = aws.a-role
}


resource "aws_iam_user_policy" "assume_ploicy" {
  name = "auume-policy"
  user = aws_iam_user.assume-user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action":"sts:AssumeRole",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/a-role"
    }
  ]
}
EOF
}

/* output "arole_id" {
  value = data.aws_caller_identity.current.id
} */

