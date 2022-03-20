- name: Run cluster Verification Checks for CRS Installation
  when: inventory_hostname == 'n1'
  become: yes
  become_user: grid
  command:            '{{ grid_home}}/runcluvfy.sh stage -post crsinst -n "n1,n1" -verbose'
  register:           cluvfy_stage_pre_crsinst
  failed_when:        false
  no_log:             true
