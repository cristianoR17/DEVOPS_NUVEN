data "aws_iam_policy_document" "sqs_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["XXXXXXXXXX"]
    } 
      principals{
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
      }

    actions = ["sqs:*"]
    resources = ["*"]
  }
}