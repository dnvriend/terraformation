#cloud-config
cloud_final_modules:
  - [users-groups,always]
users:
  - default
  - name: dnvriend
    gecos: Dennis Vriend
    groups: [ "wheel" ]
    sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
    shell: /bin/bash
    ssh-authorized-keys:
      - ${dnvriend_key}
  - name: dnvriend2
    gecos: Dennis Vriend 2
    groups: [ "wheel" ]
    sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
    shell: /bin/bash
    ssh-authorized-keys:
      - ${dnvriend2_key}
