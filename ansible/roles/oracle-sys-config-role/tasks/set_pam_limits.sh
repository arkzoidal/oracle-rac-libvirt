# Add or modify nofile soft limit for the user joe

- pam_limits:
    domain: oracle
    limit_type: soft
    limit_item: stack
    value: 10240

- pam_limits:
    domain: grid
    limit_type: soft
    limit_item: stack
    value: 10240

- ansible.posix.sysctl:
    name: kernel.panic
    value: '1'
    reload: yes
