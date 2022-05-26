resource "google_pubsub_lite_reservation" "example" {
  name                = var.reservation
  project             = var.project_id
  throughput_capacity = var.throughput_capacity
  region              = var.region
}
resource "google_pubsub_lite_subscription" "example" {
  name   = var.subscription
  topic  = var.topic
  zone   = var.zone
  region = var.region
  delivery_config {
    delivery_requirement = "DELIVER_AFTER_STORED"
  }
  depends_on = [
    google_pubsub_lite_topic.example
  ]
}

resource "google_pubsub_lite_topic" "example" {
  name    = var.topic
  zone    = var.zone
  region  = var.region
  project = var.project_id

  partition_config {
    count = 1
    capacity {
      publish_mib_per_sec   = 4
      subscribe_mib_per_sec = 8
    }
  }

  retention_config {
    per_partition_bytes = 32212254720
  }

  reservation_config {
    throughput_reservation = google_pubsub_lite_reservation.example.name
  }
  depends_on = [
    google_pubsub_lite_reservation.example
  ]
}




