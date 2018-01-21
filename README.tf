== Abstract ==
These are some tools to create a kubernetes cluster in Digitalocean.
* terraform creates the VMs
* kubeadm manages Kubernetes configuration
* ansible configures and runs kubeadm on the servers
* contiv for the network layer

== Requirements ==

=== DigitalOcean account ===
* setup your info in tf_env.sh

=== terraform ===
* http://www.terraform.io/downloads.html
* https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

=== ansible ===
Using https://github.com/kairen/kubeadm-ansible

== What it does ==
creates nodes on DO

Install kubeadm on them
* https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
* https://kubernetes.io/docs/setup/independent/install-kubeadm/

and deploy kubernetes through kubeadm

== Run ==
* ./genkey.sh # Only once, to generate the kube user key
* cd terraform
* ../gen_nodes_from_manager1.sh
* eval terraform plan $(../params.sh)
* eval terraform apply $(../params.sh)
* eval terraform destroy $(../params.sh)
* ../generate_inventory.sh > ../ansible/inventory
* cd ../ansible
* ansible-playbook -i inventory site.yml -u root

== Connect ==
* ssh -i keys/kubekey kube@[manager IP]

== Caveats ==
* kubeadm currently supports only one master, so this is not suitable for production
