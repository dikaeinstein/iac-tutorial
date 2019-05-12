resource "google_compute_instance" "raddit" {
  name = "raddit-instance"
  machine_type = "n1-standard-1"
  zone = "europe-west2-c"

  # boot disk specification
  boot_disk {
    initialize_params {
      image = "raddit-base" // use image built with packer
    }
  }

  # networks to attach to the vms
  network_interface {
    network = "default"
    access_config = {} // use ephemeral public ip
  }
}

resource "google_compute_project_metadata" "raddit" {
  metadata {
    ssh-keys = "raddit-user:${file("~/.ssh/raddit-user.pub")}" // path to ssh key file
  }
}

resource "google_compute_firewall" "raddit" {
  name = "allow-raddit-tcp-9292"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
}

output "raddit_public_ip" {
  value = "${google_compute_instance.raddit.network_interface.0.access_config.0.assigned_nat_ip}"
}
