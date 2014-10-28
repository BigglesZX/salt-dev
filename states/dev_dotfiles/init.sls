dotfiles:
    git.latest:
        - name: git@github.com:BigglesZX/dotfiles.git
        - target: /home/vagrant/dotfiles
        - rev: master
        - identity: /home/vagrant/.ssh/id_rsa
        - user: vagrant
        - group: vagrant
        - require:
            - pkg: ensure_git_installed
            - file: copy_private_ssh_key
            - file: copy_public_ssh_key
