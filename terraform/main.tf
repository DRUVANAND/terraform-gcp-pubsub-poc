resource "google_pubsub_topic" "example" {
  name = "dhruv-topic-github"

  labels = {
    foo = "bar"
  }

  message_retention_duration = "86600s"
}


resource "google_pubsub_subscription" "example" {
  name  = "dhruv-subscription-github"
  topic = google_pubsub_topic.example.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering    = false
}
