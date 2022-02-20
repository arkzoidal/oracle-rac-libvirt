#ANSIBLE_HOME=/home/vagrant/RACROC/ansible ansible-playbook playbooks/oracle_GI_RAC.yml --extra-vars "hostgroup=rac21c01 pre_grid_setup=y"
#ANSIBLE_HOME=/home/vagrant/RACROC/ansible ansible-playbook playbooks/oracle_DB_RAC.yml --extra-vars "hostgroup=rac21c01"
#ANSIBLE_HOME=/home/vagrant/RACROC/ansible ansible-playbook playbooks/site.yml --extra-vars "hostgroup=rac21c01"

ANSIBLE_HOME=/home/vagrant/RACROC/ansible ansible-playbook playbooks/oracle_CREATE_DB.yml --extra-vars "hostgroup=rac21c01"
