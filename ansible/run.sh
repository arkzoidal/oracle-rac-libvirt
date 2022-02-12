/usr/bin/cp -f vagrant_ansible_inventory  inventory
export ANSIBLE_HOME=/home/vagrant/RACROC/ansible
ansible-playbook playbooks/oracle_GI_RAC.yml --extra-vars "hostgroup=rac19c01 pre_grid_setup=y"
