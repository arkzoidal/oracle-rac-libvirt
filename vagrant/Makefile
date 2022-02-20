create:
	vagrant up --provider=libvirt
	vagrant provision --provision-with create_inventory
	/usr/bin/cp -f .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../ansible/inventory/vagrant_ansible_inventory
	/usr/bin/cp -f .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory /home/ansible/tests-env/loops/inventory/vagrant_ansible_inventory
destroy:
	vagrant destroy -f
	rm -rf .vagrant
