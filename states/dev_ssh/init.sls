ensure_ssh_installed:
    pkg:
        - installed
        - name: ssh

copy_private_ssh_key:
    file.managed:
        - name: /home/vagrant/.ssh/id_rsa
        - user: vagrant
        - group: vagrant
        - mode: 600
        # run `init.sh` in the root of this project to copy your private key into the `files` folder
        - source: salt://dev_ssh/files/id_rsa
        - require:
            - pkg: ensure_ssh_installed

copy_public_ssh_key:
    file.managed:
        - name: /home/vagrant/.ssh/id_rsa.pub
        - user: vagrant
        - group: vagrant
        - mode: 600
        # run `init.sh` in the root of this project to copy your public key into the `files` folder
        - source: salt://dev_ssh/files/id_rsa.pub
        - require:
            - pkg: ensure_ssh_installed
