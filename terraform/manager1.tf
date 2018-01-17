resource "digitalocean_droplet" "manager1" {
    image = "ubuntu-17-10-x64"
    name = "manager1"
    region = "fra1"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
  connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get update",
      "apt-get install -y docker.io"
    ]
  }
}

output "manager1.ip" {
  value = "${digitalocean_droplet.manager1.ipv4_address}"
}


