#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

variable "kms_data_key_reuse_period_seconds"{
  description =  "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again."
  type = integer
  default = 300
}


#-----------------------------------------------------------
# SQS queue
#-----------------------------------------------------------
variable "enable_sqs_queue" {
  description = "Enable SQS queue usage"
  default     = false
}

variable "sqs_queue_name" {
  description = "description"
  default     = ""
}

variable "name_prefix" {
  description = "description"
  default     = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with sqs_queue_name"
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds."
  default     = 90
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)."
  default     = 2048
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days)."
  default     = 86400
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
  default     = 10
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  default     = false
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues."
  default     = false
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  default     = "alias/aws/sqs"
}


variable "maxReceiveCount" {
  description = "Value for redrive_policy (set maxReceiveCount for dead_letter_queue)"
  default     = 10
}

variable "sqs_dead_letter_queue_arn" {
  description = "Set sqs arn for dead_letter_queue"
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "the timeout in seconds of visibility of the message"
  default     = 30
}

variable "sqs_queue_policy" {
  description = "(Optional) The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform"
  default     = null
}

#---------------------------------------------------
# AWS SQS queue policy
#---------------------------------------------------
variable "enable_sqs_queue_policy" {
  description = "Enable SQS queue policy"
  default     = false
}

variable "queue_url" {
  description = "(Required) The URL of the SQS Queue to which to attach the policy"
  default     = ""
}
