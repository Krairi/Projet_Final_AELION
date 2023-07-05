#Changer le host et hostname
sudo sed -i "s/debian/backup/g" /etc/hostname /etc/hosts
# Redemarrer ma vm
sudo reboot
#########################################################################
# Aller dans install_oracle.sh pour créer la clé ssh
# Récupérer la clé ssh
mkdir .ssh # créer un dossier
ls -dl .ssh
cat /tmp/id_rsa_backup.pub >> .ssh/authorized_keys
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

