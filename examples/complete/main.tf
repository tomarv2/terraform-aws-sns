data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = ">= 3.63"
    }
  }
}

data "aws_iam_policy_document" "sns_policy" {
  policy_id = "__default_policy_ID"

  statement {
    sid     = "org-publish"
    effect  = "Allow"
    actions = ["SNS:Publish"]

    condition {
      test     = "StringEquals"
      variable = "AWS:principalOrgId"
      values   = ["o-g29axo4oyt", "o-sna0c2ood6"]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}-notify",
    ]
  }

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.current.account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}-notify",
    ]

    sid = "__default_statement_ID"
  }

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:Receive",
    ]

    condition {
      test     = "StringLike"
      variable = "SNS:Endpoint"

      values = [
        "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}-notify",
    ]

    sid = "__console_sub_0"
  }
}

module "sns" {
  source = "../../"

  deploy_sns       = true
  sns_subscription = false
  policy           = data.aws_iam_policy_document.sns_policy.json
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
