#!/bin/bash
start=`date +%s`

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
sudo ansible -i hosts.txt all -m ping --private-key=~/.ssh/custom_id
sudo ansible-playbook side.yml

end=`date +%s`

runtime=$((end-start))

echo "Время выполнения составило $runtime секунд"
