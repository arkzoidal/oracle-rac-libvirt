# vagrant-libvirt-ansible-oracle-rac

- Installs Oracle RAC
- Start with one or more clean machine(s), end up with a fully configured RAC Cluster.

### Getting started

Pre-requisites:

- Ansible >= 2.4
- Rocky Linux >= 8
- Oracle Database/Grid Infrastructure 19.3.0.0

1. Clone this repository:
   `git clone --recursive https://github.com/arkzoidal/vagrant-libvirt-ansible-oracle-rac`

2. Add the following file to `/tmp` on the controlmachine
   - `LINUX.X64_180000_db_home.zip`

3. Create an Ansible inventory file
   ```
   [myhostgroup]
    dbhost
   ```

4. Run the playbook:

   `ansible-playbook single-instance-db-on-fs.yml -e hostgroup=myhostgroup -i /path/to/inventory`

   where the `-i` part is optional


### Roles
