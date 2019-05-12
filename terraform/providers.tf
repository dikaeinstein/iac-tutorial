provider "google" {
  version = "~> 1.2.0"
  project = "${var.project}"
  region = "europe-west2"
}
