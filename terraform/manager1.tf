resource "digitalocean_droplet" "manager1" {
  image = "ubuntu-17-10-x64"
  name = "manager1"
  region = "fra1"
  size = "2gb"
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
  provisioner "file" {
    source      = "scripts/ansible-dependencies.sh"
    destination = "/tmp/ansible-dependencies.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ansible-dependencies.sh",
      "/tmp/ansible-dependencies.sh",
    ]
  }
}

output "manager1.ip.public" {
  value = "${digitalocean_droplet.manager1.ipv4_address}"
}

output "manager1.ip.private" {
  value = "${digitalocean_droplet.manager1.ipv4_address_private}"
}


