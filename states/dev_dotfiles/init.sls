copy_private_dotfiles_deploy_key:
    file.managed:
        - name: /home/vagrant/.ssh/dotfiles_deploykey
        - user: vagrant
        - group: vagrant
        - mode: 600
        - source: salt://dev_dotfiles/files/deploykey
        - require:
            - pkg: ensure_ssh_installed

copy_public_dotfiles_deploy_key:
    file.managed:
        - name: /home/vagrant/.ssh/dotfiles_deploykey.pub
        - user: vagrant
        - group: vagrant
        - mode: 600
        - source: salt://dev_dotfiles/files/deploykey.pub
        - require:
            - pkg: ensure_ssh_installed

dotfiles:
    git.latest:
        - name: git@github.com:BigglesZX/dotfiles.git
        - target: /home/vagrant/dotfiles
        - rev: master
        - identity: /home/vagrant/.ssh/dotfiles_deploykey
        - user: vagrant
        - require:
            - pkg: ensure_git_installed
            - file: copy_private_dotfiles_deploy_key
            - file: copy_public_dotfiles_deploy_key
