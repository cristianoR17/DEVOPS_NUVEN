variable "region" {
  type    = string
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::308103291514:role/terraform-role"
    external_id = "5ec18450-8cc7-4d07-b353-c84b549c84a2"
  }
}

variable "tags" {
  type = map(string)
  default = {
    Project     = "not-so-simple-ecommerce"
    Environment = "production"
  }
}

variable "queues" {
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number 
    sqs_managed_sse_enabled  =  bool 
  }))

  default =[{
      name                      = "EmailNotificationQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    
    },
    {
      name                      = "ProductStockQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    },
    {
      name                      = "InvoiceQueue"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    }
  ]
}

variable "dlqueues" {
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number 
    sqs_managed_sse_enabled  =  bool 
  }))

  default =[{
      name                      = "EmailNotificationQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    
    },
    {
      name                      = "ProductStockQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    },
    {
      name                      = "InvoiceQueueDlq"
      delay_seconds             = 0
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
      sqs_managed_sse_enabled   = true
    }
  ]
}

variable "order_confirmed_topic" {
  type = object({
    role_name                       = string    
    name                            = string
    sqs_sucess_feedback_sample_rate = number
    subscriptions                  = list(string)
  })
  
  default = {
    role_name                       = "SnsTopicRole"    
    name                            = "OrderConfirmedTopic"
    sqs_sucess_feedback_sample_rate = 100
    subscriptions                  = ["InvoiceQueue", "ProductStockQueue"]
  }
}







