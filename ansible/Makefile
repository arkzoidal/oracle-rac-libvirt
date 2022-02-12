all:
	/usr/bin/cp -f vagrant_ansible_inventory  inventory
	ansible-playbook install-custom-facts.yaml --extra-vars "variable_host=rac19c01"
	ansible-playbook resize_domains_disk_image.yml --extra-vars "variable_host=rac19c01"
	ansible-playbook install-custom-facts.yaml --extra-vars "variable_host=rac19c01"
	ansible-playbook setup_eth12.yml --extra-vars "variable_host=rac19c01"
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "variable_host=rac19c01 debug=1" --tags oracle_gi_install
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "variable_host=rac19c01 debug=1" --tags set_hostname_domain_name,oracle_sys_config 
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "variable_host=rac19c01 debug=1" --tags update_etc_hosts,oracle_gi_install
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "variable_host=rac19c01 debug=1" --tags install_home_gi
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "variable_host=rac19c01 debug=1" --tags setup_responsile_file
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "configure_cluster=true variable_host=rac19c01 debug=1" --tags setup_responsile_file
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "configure_cluster=true variable_host=rac19c01 hostgroup=rac19c01 debug=1" --tags setup_responsile_file
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "configure_cluster=true variable_host=rac19c01 hostgroup=rac19c01 debug=1" --tags update_etc_hosts
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "configure_cluster=true hostgroup=rac19c01 debug=1" --tags oracle_gi_install
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "hostgroup=rac19c01 debug=1" --tags oracle_sys_config
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "hostgroup=rac19c01 debug=1" --tags oracle_gi_install
	ansible-playbook oracleGInRAC19cR3.yml --extra-vars "hostgroup=rac19c01" 

setup_vm:
	ansible-playbook customfacts-install.yaml
	ansible-playbook resize_domains_disk_image.yml
	ansible-playbook display_disks_size.yml

debug:
	ANSIBLE_DEBUG=1 ansible-playbook -vvv oracleGInRAC19cR3.yml

hostvars:
	ansible -m debug -a "var=hostvars[inventory_hostname]" 
hostvars:
	ansible -m debug -a "var=hostvars[inventory_hostname]" 
groupvars:
	ansible -m debug -a "var=groupvs[inventory_hostname]" 
	ansible rac19c01 -m debug -a "var=server_list"
	ansible blop-vm1 -m setup -a 'filter=ansible_distribution*'
	ansible rac19c01 -m debug -a "var=node1_fq_vipname"
	ansible rac19c01 -m debug -a "var=groups['hostgroup_hub']"
        ansible rac19c01 -m debug -a "var=groups['rac19c01']"
	ansible rac19c01 -m debug -a "var=groups['{{ clusterName }}']"
	ansible rac19c01 -m debug -a "var=hostvars[oracle_gi_cluster_type]"
        ansible rac19c01 -m debug -a "var=hostvars[inventory_hostname]"
	ansible rac19c01 -m debug -a "var=hostvars[inventory_hostname].oracle_gi_cluster_type"
	ansible rac19c01 -m debug -a "var=hostvars[inventory_hostname].scan_ip_1"
	ansible all -i "localhost," -c local -m template -a "src=test.txt.j2 dest=./test.txt" --extra-vars="configure_cluster=true variable_host=rac19c01 hostgroup=rac19c01 debug=1"
	ansible rac19c01 -m debug -a "var=hostvars[item.0][inventory_hostname]['ipv4']['address']"
listgroups:
	ansible localhost -m debug -a 'var=groups.keys()' 
n1vars:
	ansible n1 -m debug -a "var=[ansible_user]" 
dumpi:
	ansible-inventory  --list
	ansible-inventory  --list | jq "keys"
setup:
	ansible -m setup dbservers
	ansible n1 -m ansible.builtin.setup -a "filter=ansible_local"
