output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = module.sns.sns_topic_arn
}

output "sns_topic_name" {
  description = "The name of the SNS topic"
  value       = module.sns.sns_topic_name
}
