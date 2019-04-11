user account for cloudworker-2:
  user.present:
    - name: cloudworker-2
    - shell: /bin/bash
    - home: /home/cloudworker-2
    - groups:
      - sudo
