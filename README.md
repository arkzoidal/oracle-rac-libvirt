# oracle-rac-libvirt

- Install Oracle RAC
- Start with two or more clean machine(s), end up with a fully configured RAC Cluster.

### Getting started

Pre-requisites:

- Ansible >= 2.4
- Rocky Linux >= 8
- Oracle Database/Grid Infrastructure 19.3.0.0

1. Clone this repository:
   `git clone --recursive https://github.com/arkzoidal/oracle-rac-libvirt`

2. Add the following file to `host_staging_dir` on the controlmachine
   host_staging_dir is defined in the oracle_sys_config ansible role , in vars/main.yml

   - `oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm`
   - `LINUX.X64_193000_grid_home.zip`

3. Create an Ansible inventory file
   ```
   [myhostgroup]
    dbhost
   ```

4. Run the playbook:

   `ansible-playbook single-instance-db-on-fs.yml -e hostgroup=myhostgroup -i /path/to/inventory`

   where the `-i` part is optional


### Roles
