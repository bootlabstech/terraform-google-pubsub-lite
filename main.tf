resource "google_pubsub_lite_reservation" "reservation" {
  name                = var.name_reservation
  project             = var.project_id
  throughput_capacity = var.throughput_capacity
  region              = var.region
}

resource "google_pubsub_lite_topic" "topic" {
  name    = var.name_topic
  zone    = var.zone
  region  = var.region
  project = var.project_id

  dynamic "partition_config" {
    for_each = var.enable_partition_config ? [{}] : []
    content {
      count = var.partition_config_count
      capacity {
        publish_mib_per_sec   = var.publish_mib_per_sec
        subscribe_mib_per_sec = var.subscribe_mib_per_sec
      }
    }
  }
  dynamic "retention_config" {
    for_each = var.enable_retention_config ? [{}] : []
    content {
      per_partition_bytes = var.per_partition_bytes
    }
  }
  dynamic "reservation_config" {
    for_each = var.enable_reservation_config ? [{}] : []
    content {
      throughput_reservation = google_pubsub_lite_reservation.reservation.name
    }
  }
}

resource "google_pubsub_lite_subscription" "subscription" {
  project = var.project_id
  name    = var.name_subscription
  topic   = var.topic
  zone    = var.zone
  region  = var.region

  dynamic "delivery_config" {
    for_each = var.enable_delivery_config ? [{}] : []
    content {
      delivery_requirement = var.delivery_requirement
    }
  }
}




