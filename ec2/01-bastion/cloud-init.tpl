#cloud-config
users:
  - default
  - name: dnvriend
    ssh-authorized-keys:
      - ${dnvriend_key}
  - name: dnvriend2
    ssh-authorized-keys:
      - ${dnvriend2_key}
