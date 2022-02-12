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

[root@del2 vagrant]# make
ANSIBLE_CONFIG=../ansible/ansible.cfg vagrant up --provider=libvirt

│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
 Oracle RAC (Real Application Cluster) Vagrant box for libvirt                    
 Copyright (c) Arkzoidal                                                          
----------------------------------------------------------------------------------
 Author: Arkzoidal      <https://www.arkzoidal.xyz>                               
│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│


Bringing machine 'db1' up with 'libvirt' provider...
Bringing machine 'db2' up with 'libvirt' provider...
==> db1: Checking if box 'rockylinux/8' version '4.0.0' is up to date...
==> db1: Creating image (snapshot of base box volume).
==> db1: Creating domain with the following settings...

PLAY RECAP *********************************************************************
db2                        : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

==> db1: Running provisioner: add_root_pubkey_vagrant (shell)...
    db1: Running: inline script
==> db2: Running provisioner: add_root_pubkey_vagrant (shell)...
    db2: Running: inline script
==> db1: Running provisioner: shell...
    db1: Running: inline script
==> db2: Running provisioner: shell...
    db2: Running: inline script
==> db1: Running provisioner: add_root_pubkey_root (shell)...
    db1: Running: inline script
==> db2: Running provisioner: add_root_pubkey_root (shell)...
    db2: Running: inline script
echo copying vagrant_ansible_inventory to ../ansible/inventory/inventory
copying vagrant_ansible_inventory to ../ansible/inventory/inventory
/usr/bin/cp -f .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ../ansible/inventory/inventory

   You should now have two running vm whose status can be displayes using 
     virsh list and a up to dare inventory file located in ansible/inventory 

4. Run the playbook  located in ansible/playbook:

  - cd ansible
  - ./run.sh

...

        "2022/02/12 18:35:23 CLSRSC-325: Configure Oracle Grid Infrastructure for a Cluster ... succeeded"
    ]
}
skipping: [db2]

TASK [oracle-gi-install-role : Execute root.sh on the other nodes] ******************************************************************************************************************
skipping: [db1]

        "2022/02/12 18:39:06 CLSRSC-325: Configure Oracle Grid Infrastructure for a Cluster ... succeeded"
    ]
}

TASK [oracle-gi-install-role : check ASM pmon] **************************************************************************************************************************************
ok: [db2]
ok: [db1]

TASK [oracle-gi-install-role : Print return information from the previous task] *****************************************************************************************************
skipping: [db1]
skipping: [db2]

TASK [oracle-gi-install-role : Update oratab] ***************************************************************************************************************************************
changed: [db2] => (item={'changed': False, 'stdout': '+ASM2', 'stderr': '', 'rc': 0, 'cmd': 'ps -u grid | grep -i "asm_pmon_+ASM2" | grep -v grep | sed \'s/^.*pmon_//g\' | tr \'[:lower:]\' \'[:upper:]\'', 'start': '2022-02-12 18:39:10.899932', 'end': '2022-02-12 18:39:10.930744', 'delta': '0:00:00.030812', 'msg': '', 'stdout_lines': ['+ASM2'], 'stderr_lines': [], 'failed': False})
changed: [db1] => (item={'changed': False, 'stdout': '+ASM1', 'stderr': '', 'rc': 0, 'cmd': 'ps -u grid | grep -i "asm_pmon_+ASM1" | grep -v grep | sed \'s/^.*pmon_//g\' | tr \'[:lower:]\' \'[:upper:]\'', 'start': '2022-02-12 18:39:11.499995', 'end': '2022-02-12 18:39:11.571193', 'delta': '0:00:00.071198', 'msg': '', 'stdout_lines': ['+ASM1'], 'stderr_lines': [], 'failed': False})

RUNNING HANDLER [ansible-ipv6-role : rmmodipv6] *************************************************************************************************************************************
changed: [db2]
changed: [db1]

RUNNING HANDLER [ansible-ipv6-role : restart network] *******************************************************************************************************************************
skipping: [db1]
skipping: [db2]

RUNNING HANDLER [ansible-ipv6-role : restart NetworkManager] ************************************************************************************************************************
changed: [db2]
changed: [db1]

PLAY RECAP **************************************************************************************************************************************************************************
db1                        : ok=173  changed=117  unreachable=0    failed=0    skipped=39   rescued=0    ignored=0   
db2                        : ok=142  changed=91   unreachable=0    failed=0    skipped=58   rescued=0    ignored=0   




### Roles
