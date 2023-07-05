#Changer le host et hostname
sudo sed -i "s/debian/ansible/g" /etc/hostname /etc/hosts
# Redemarrer ma vm
sudo reboot
# Vérifier la version python
python3 --version
# Mettre à jours mes logiciel
sudo apt update
sudo apt upgrade
# Installer ansible
sudo apt install ansible
# Installer sshpass
sudo apt install sshpass
# Créer les différents répertoire
mkdir Ansible
cd Ansible
mkdir 01-firstSteps
cd 01-firstSteps/
# Créer l'inventaire des hosts
vi inventory.ini # Mettre le host de vos différentes vm sauf la vm integration
[hosts]
192.168.186.132
192.168.186.171
192.168.186.173
192.168.186.175
192.168.186.177
192.168.186.179
192.168.186.180
# Vérifier si l'inventaire fonctionne en faisant un ping sur les réseaux
ssh 192.168.186.132 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.171 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.173 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.175 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.177 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.179 # A chacune de ces étapes faire yes + Ctrl+c
ssh 192.168.186.180 # A chacune de ces étapes faire yes + Ctrl+c
ansible -i hosts -u djawed -k -m ping hosts # Indiquer son mot de passe utilisateur
# Créer un fichier yml pour installé la clé
vi create_ssh_keys.yml
# Créer un unfichier d'éxécution 
vi execute_playbook.sh
# Rendre exécutable le fichier 
chmod +x execute_playbook.sh
# Exécuter le script Bash
./execute_playbook.sh

