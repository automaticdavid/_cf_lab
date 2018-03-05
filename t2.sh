

#  create vault before run

ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass upgrade.yml -vvv
ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass pre-zone.yml --skip-tags updates -v
ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass post-zone.yml --skip-tags updates
