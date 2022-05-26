variable "reservation" {
  type        = string
  description = "The pubsub_lite_reservation name"
  default     = "demo-reservation12"
}
variable "project_id" {
  type        = string
  description = "project_number"
  default     = "sailor-321711"
}
variable "topic" {
  type        = string
  description = "The pubsub_lite topic name"
  default     = "demo-topic12"
}
variable "region" {
  type        = string
  description = "name of the region"
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "name of the zone"
  default     = "us-central1-a"
}

variable "subscription" {
  type        = string
  description = "name of the subscription"
  default     = "demo-subscription1"
}

variable "throughput_capacity" {
  type        = number
  description = "(optional) describe your variable"
  default     = 2
}