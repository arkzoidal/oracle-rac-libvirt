create:
	ANSIBLE_CONFIG=../ansible/ansible.cfg vagrant up --provider=libvirt
	echo copying vagrant_ansible_inventory to ../ansible/inventory/inventory
	/usr/bin/cp -f .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../ansible/inventory/inventory
destroy:
	vagrant destroy -f
	rm -rf .vagrant
