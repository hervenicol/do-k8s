== Requirements ==

=== DigitalOcean account ===

=== terraform ===
* http://www.terraform.io/downloads.html
* https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

=== kubeadm ===
installed per node
* https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
* https://kubernetes.io/docs/setup/independent/install-kubeadm/


== Run ==
* eval terraform plan $(./params.sh)
* eval terraform apply $(./params.sh)
* eval terraform destroy $(./params.sh)
