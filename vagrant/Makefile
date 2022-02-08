create:
	vagrant up --provider=libvirt
	vagrant provision --provision-with create_inventory
destroy:
	vagrant destroy -f
	rm -rf .vagrant
