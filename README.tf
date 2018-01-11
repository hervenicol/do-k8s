== Requirements ==

=== DigitalOcean account ===

=== terraform ===
* http://www.terraform.io/downloads.html
* https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

=== ansible ===

== What it does ==
creates nodes on DO

Install kubeadm on them
* https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
* https://kubernetes.io/docs/setup/independent/install-kubeadm/

and deploy kubernetes through kubeadm

== Run ==
* ./gen_nodes_from_manager1.sh
* eval terraform plan $(./params.sh)
* eval terraform apply $(./params.sh)
* eval terraform destroy $(./params.sh)