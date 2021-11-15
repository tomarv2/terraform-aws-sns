locals {
  name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
}

resource "aws_sns_topic" "this" {
  count = var.deploy_sns ? 1 : 0

  name = local.name
  tags = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)

  delivery_policy   = var.delivery_policy
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  policy            = var.policy

  fifo_topic                  = var.fifo_topic
  content_based_deduplication = var.content_based_deduplication

  application_failure_feedback_role_arn    = var.application_failure_feedback_role_arn
  application_success_feedback_role_arn    = var.application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.application_success_feedback_sample_rate

  http_failure_feedback_role_arn    = var.http_failure_feedback_role_arn
  http_success_feedback_role_arn    = var.http_success_feedback_role_arn
  http_success_feedback_sample_rate = var.http_success_feedback_sample_rate

  lambda_failure_feedback_role_arn    = var.lambda_failure_feedback_role_arn
  lambda_success_feedback_role_arn    = var.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate = var.lambda_success_feedback_sample_rate

  sqs_failure_feedback_role_arn    = var.sqs_failure_feedback_role_arn
  sqs_success_feedback_role_arn    = var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate = var.sqs_success_feedback_sample_rate

  firehose_failure_feedback_role_arn    = var.firehose_failure_feedback_role_arn
  firehose_success_feedback_role_arn    = var.firehose_success_feedback_role_arn
  firehose_success_feedback_sample_rate = var.firehose_success_feedback_sample_rate
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  count = var.deploy_sns && var.sns_subscription ? 1 : 0

  topic_arn = aws_sns_topic.this[0].arn
  protocol  = var.subscription_protocol
  endpoint  = var.endpoint
}
