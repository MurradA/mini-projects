data "aws_iam_policy_document" "sns_topic_policy" {
  policy              = <<EOF 
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:Publish",
        "SNS:RemovePermission",
        "SNS:SetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:AddPermission",
        "SNS:Subscribe"
      ],
      "Resource": "${aws_sns_topic.adoption_alerts.arn}",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "439675880352"
        }
      }
    },
    {
      "Sid": "__console_pub_0",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "439675880352"
        ]
      },
      "Action": "SNS:Publish",
      "Resource": "${aws_sns_topic.adoption_alerts.arn}"
    },
    {
      "Sid": "__console_sub_0",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "439675880352"
        ]
      },
      "Action": [
        "SNS:Subscribe"
      ],
      "Resource": "${aws_sns_topic.adoption_alerts.arn}"
    }
  ]
}
EOF
}

resource "aws_sns_topic" "adoption_alerts" {
  name            = "adoption-alerts"
}
