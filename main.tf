resource "google_pubsub_lite_reservation" "example" {
  name                = var.reservation
  project             = var.project_id
  throughput_capacity = var.throughput_capacity
  region              = var.region
}

resource "google_pubsub_lite_topic" "example" {
  name    = var.topic
  zone    = var.zone
  region  = var.region
  project = var.project_id

  dynamic "partition_config" {
    for_each = var.partition_config_count
    content {
      count                   = partition_config.value.partition_config_count
      capacity {
        publish_mib_per_sec   = partition_config.value.capacity.publish_mib_per_sec
        subscribe_mib_per_sec = partition_config.value.capacity.subscribe_mib_per_sec
      }
    }
  }
  
  dynamic "retention_config" {
    for_each = var.per_partition_bytes 
    content {
     per_partition_bytes = retention_config.value.per_partition_bytes 
    }
  }

  reservation_config {
    throughput_reservation = google_pubsub_lite_reservation.example.name
  }
  depends_on = [
    google_pubsub_lite_reservation.example
  ]
}

resource "google_pubsub_lite_subscription" "example" {
  project = var.project_id
  name   = var.subscription
  topic  = var.topic
  zone   = var.zone
  region = var.region
  
 dynamic "delivery_config" {
    for_each = var.delivery_requirement
    content {
      delivery_requirement = delivery_config.value.delivery_requirement
    }
  }
  depends_on = [
    google_pubsub_lite_topic.example
  ]
}

