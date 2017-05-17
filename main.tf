variable "region" {
  default = "us-west1" // We're going to need it in several places in this config
}
variable "zone" {
  default = "us-west1-a" // We're going to need it in several places in this config
}

provider "google" {
  credentials = "${file("account.json")}" //download private key file from GCE and store it in the name account.json in the same folder of terraform files
  project     = "liquid-crossing-167205"	//project name created in GCE. if it is not there, create new one
  region      = "${var.region}"
}

resource "google_compute_instance" "test" {
  count        = 1 // Adjust as desired
  name         = "debian-8" // name of the virtual machine will be created in GCE
  machine_type = "f1-micro" // smallest (CPU &amp; RAM) available instance
  zone         = "${var.zone}"

  disk {
    image = "debian-8-jessie-v20170426" // the operative system (and Linux flavour) that your machine will run, get the list in google
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }
}
