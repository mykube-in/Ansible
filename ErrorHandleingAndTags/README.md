  ansible-playbook --tags install-tag  tags-playbook.yaml
  ansible-playbook --tags config-tag  tags-playbook.yaml
  ansible-playbook --skip-tags config-tag  tags-playbook.yaml

  ansible-playbook --tags install error-handeling.yaml # since tag applied the block will be ignored
  ansible-playbook --tags create-error  error-handeling.yaml 
  ansible-playbook  error-handeling.yaml 
