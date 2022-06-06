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

  partition_config {
    count = var.partition_config_count
    capacity {
      publish_mib_per_sec   = var.publish_mib_per_sec
      subscribe_mib_per_sec = var.subscribe_mib_per_sec
    }
  }

  retention_config {
    per_partition_bytes = var.per_partition_bytes
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
  name    = var.subscription
  topic   = var.topic
  zone    = var.zone
  region  = var.region

  delivery_config {
    delivery_requirement = var.delivery_requirement
  }

  depends_on = [
    google_pubsub_lite_topic.example
  ]
}

