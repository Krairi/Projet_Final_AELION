#Changer le host et hostname
sudo sed -i "s/debian/jenkins/g" /etc/hostname /etc/hosts
# Redemarrer ma vm
sudo reboot
# Créer un utilisateur jenkins avec un home
sudo useradd -m -s /bin/bash jenkins
# Mettre jenkins dans le groupe sudo
sudo usermod -aG sudo djawed
# Redemarrer ma vm
sudo reboot
# Se connecter à l'utilisateur jenkins
su -
su - jenkins
# crèer les clés
ssh-keygen
# Dèfinir les droits
chmod 700 .ssh
# Se placer dans le dossier .ssh
cd .ssh
# Supprimer les 2 clès
rm id*
# Se connecter en root
su
# Dèplacer les 2 clès present dans /tmp
mv /tmp/id_rs* .
# Dèfinir les droits
chmod 600 id_rsa
# Rendre jenkins propriétaire de ce dossier
chown jenkins:jenkins /home/jenkins/.ssh/id*
# Se connecter à l'utilisateur jenkins
su jenkins
# créer un fichier config
vi config # Coller les éléments qui suient
Host github.com
        Hostname github.com
        IdentityFile=/home/jenkins/.ssh/id_rsa
# Dèfinir les droits
chmod 600 config
# Se positionner dans le home de l'utilisateur jenkins
cd
# Cloner le git proteger de Matthias
git clone git@github.com:matthcol/movieapi2k3.git
git clone -b ora-nodocker https://github.com/matthcol/dbmovie
git clone -b devf1 https://github.com/matthcol/movie_angular.git
# Mettre à jours mes logiciel
sudo apt update
sudo apt upgrade
# Installer les différents logiciels
sudo apt install openjdk-17-jdk
sudo apt install maven
# Telecharger le fichier jenkins.war dans le home
wget https://get.jenkins.io/war-stable/2.387.2/jenkins.war
# Lancer jenkins
java -jar jenkins.war
# Vérifier le port en ouvrant une autre page
sudo netstat -tuplan | grep -i listen
# Lancer jenkins
http://192.168.186.132:8080

# Configurer

# Jeton d'API(token)
Token created on 2023-05-20T08:02:45.475309287+02:00
111096bd2d60fc7605bf952fc67d9cd082
# Ajout de la clé ssh publique
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGYc1NuVk9S1blPLqoylJCMNMi+w34i0NmuXsc7MDSILHw2a3IPhSMn4uIj/+tZj24Izi/rBU287gHzZCzmaS80ruhqfKrDHNvProXJE632sPT1rrDU3r3v3euJMNGv0yifsYEnIl9Bc43m9D3qRCns1ObvbB1/JslglFN8My0Gc4Czc0JCp1uRwSE/C49TbycfbPIk9lmCr2fEnBC0PUHQvjaZHxcFdhQfqgVVMlDM3V4JXcTIFKMZYRFbezCjTvMA4VUAoQBRqLhky3Q7R8v4AwqkwHJQ3m93LRIkvdP/lYftBdImXvZdUwI47PhM27w0OiKwg132/p2qX8FCZTlnQfpXyAKoz5RWsKNWS0SlEbaSInaS0Fia2qrRteCdoIdrIQuVFo3LXXF+cLSoCQlM4R6ePSrjTXOaI5PivhZTtkJ1TiDBhWQn5JXLBVXX/MM7t9fpKn+9FXUSFZHUfvLfpN304BhgWMsHVHtn878QOAJo4UDCB7MJZ3BHSahnx8= jenkins@jenkins



