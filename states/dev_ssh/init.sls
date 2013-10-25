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
        - source: salt://dev_ssh/files/id_rsa
        - require:
            - pkg.installed: ensure_ssh_installed

copy_public_ssh_key:
    file.managed:
        - name: /home/vagrant/.ssh/id_rsa.pub
        - user: vagrant
        - group: vagrant
        - mode: 600
        - source: salt://dev_ssh/files/id_rsa.pub
        - require:
            - pkg.installed: ensure_ssh_installed
