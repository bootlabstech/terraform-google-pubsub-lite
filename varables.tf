variable "reservation" {
  type        = string
  description = "The pubsub_lite_reservation name"
}
variable "project_id" {
  type        = string
  description = " The ID of the project in which the resource belongs"
}
variable "topic" {
  type        = string
  description = "The pubsub_lite topic name"
}
variable "region" {
  type        = string
  description = "name of the region"
}
variable "zone" {
  type        = string
  description = "name of the zone"
}

variable "subscription" {
  type        = string
  description = "name of the subscription"
}

variable "throughput_capacity" {
  type        = number
  description = "The reserved throughput capacity. Every unit of throughput capacity is equivalent to 1 MiB/s of published messages or 2 MiB/s of subscribed messages."
}

variable "delivery_requirement" {
  type        = string
  description = "When this subscription should send messages to subscribers relative to messages persistence in storage. Possible values are DELIVER_IMMEDIATELY, DELIVER_AFTER_STORED, and DELIVERY_REQUIREMENT_UNSPECIFIED"
}

variable "publish_mib_per_sec" {
  type        = number
  description = "Subscribe throughput capacity per partition in MiB/s. Must be >= 4 and <= 16"
}

variable "subscribe_mib_per_sec" {
  type        = number
  description = "Publish throughput capacity per partition in MiB/s. Must be >= 4 and <= 16."
}

variable "per_partition_bytes" {
  type        = number
  description = "The provisioned storage, in bytes, per partition"
}

variable "count" {
  type        = number
  description = "The number of partitions in the topic. Must be at least 1"
}