variable "deploy_sns" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "extra_tags" {
  type        = any
  description = "Extra custom tags"
  default     = null
}

variable "name" {
  description = "Name of the topic. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix"
  type        = string
  default     = null

  /*
  validation {
    condition     = length(var.name) <= 256 && can(regex("[0-9a-zA-Z_\\-]+", var.name))
    error_message = "Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long."
  }
  */
}

variable "delivery_policy" {
  description = "SNS delivery policy"
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name for the topic"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "ID of an AWS-managed KMS key for Amazon SNS or a custom KMS key"
  type        = string
  default     = null
}

variable "policy" {
  description = "Fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Boolean that toggles content-based deduplication for FIFO topics"
  type        = bool
  default     = false
}

variable "application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "application_success_feedback_role_arn" {
  description = "IAM role for success feedback"
  type        = string
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "IAM role for success feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "IAM role for success feedback"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "IAM role for success feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "firehose_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "firehose_success_feedback_role_arn" {
  description = "IAM role for success feedback"
  type        = string
  default     = null
}

variable "firehose_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "endpoint" {
  description = "Endpoint to send data to. The contents vary with the protocol."
  default     = null
  type        = string
}

variable "sns_subscription" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "subscription_protocol" {
  description = "Feature flag, true or false"
  default     = "sqs"
  type        = string
}
