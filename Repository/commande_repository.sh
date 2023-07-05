#Changer le host et hostname
sudo sed -i "s/debian/repository/g" /etc/hostname /etc/hosts
sudo vi /etc/hosts # Remplacer par ce qui suit
127.0.0.1       localhost
127.0.1.1       repository
192.168.186.177 servrepo
## The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

# Redemarrer ma vm
sudo reboot
# Créer les différents dossier
mkdir database
mkdir api
mkdir frontAngular
mkdir scriptAPI
cd scriptAPI/ # Correspond à movieapi2k3
git clone https://github.com/Krairi/TeamsAPI.git
cd ..
cd database/ # Correspond à dbmovie
git clone https://github.com/Krairi/RockyOracle.git
cd ..
cd frontAngular/ # Correspond à movie_angular 
git clone https://github.com/Krairi/teamsAngular.git
