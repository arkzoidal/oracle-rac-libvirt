# oracle-rac-libvirt

- Install Oracle RAC
- Start with two or more clean machine(s), end up with a fully configured RAC Cluster.

### Getting started

Pre-requisites:

- Ansible >= 2.4
- Rocky Linux >= 8
- Oracle Database/Grid Infrastructure 19.3.0.0
- Vagrant with libvirt plugin

1. Clone this repository:

  `git clone https://github.com/arkzoidal/oracle-rac-libvirt`

2. Add the following file to `host_staging_dir` on the controlmachine
   host_staging_dir is defined in the oracle_sys_config ansible role , in vars/main.yml

  - `oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm`
  - `LINUX.X64_193000_grid_home.zip`

3. Go the vagrant directory and create the vm by running the Makefile:

  - cd vagrant 
  - make

  have a look at create_vm.txt for the output

[root@del2 vagrant]# make

   You should now have two running vm whose status can be displayes using 
     virsh list and a up to dare inventory file located in ansible/inventory 

4. Run the playbook  located in ansible/playbook:

  - cd ansible
  - ./run.sh


### Roles


