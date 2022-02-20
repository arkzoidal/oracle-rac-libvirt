- name: install-home-db | add dotprofile
  remote_user: "{{ gv_root_user }}"
  become: yes
  become_method: sudo
  become_user: "{{ gv_oracle_user }}"
  template:
    src: dotprofile-home.j2
    dest: "/home/{{ gv_oracle_user}}/{{ gv_oracle_profile_name}}"
    owner: "{{ gv_oracle_user }}"
    group: "{{ gv_oracle_install_group }}"
    mode: 0660
  tags: create_db,dotprofile_db
