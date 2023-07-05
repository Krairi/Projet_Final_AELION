#Changer le host et hostname
sudo sed -i "s/debian/nagios/g" /etc/hostname /etc/hosts
# Redemarrer ma vm
sudo reboot
# Mettre à jours mes logiciel
sudo apt update
sudo apt upgrade
dpkg -l selinux*
apt-get update
apt-get install -y autoconf gcc libc6 make wget unzip apache2 apache2-utils php libgd-dev
apt-get install openssl libssl-dev
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz
tar xzf nagioscore.tar.gz
cd /tmp/nagioscore-nagios-4.4.6/
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install-groups-users
usermod -a -G nagios www-data
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf
a2enmod rewrite
a2enmod cgi
systemctl restart apache2
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
systemctl restart apache2.service
systemctl start nagios.service
ip a

http://192.168.186.142/nagios

apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.3.3.tar.gz
tar zxf nagios-plugins.tar.gz
cd /tmp/nagios-plugins-release-2.3.3/
./tools/setup
./configure
make
make install
systemctl start nagios.service
systemctl stop nagios.service
systemctl restart nagios.service
systemctl status nagios.service
sudo useradd -s /usr/bin/bash -r -m nagios
sudo su - nagios
[11:30]
cd /usr/local/nagios/etc
[11:30]
mkdir servers
[11:30]
cd servers
[11:31]
vi api.cfg
[11:32]
define host {
        use linux-server

        host_name api
        alias api
        address 192.168.186.149
}
###############################################################################
#
# SERVICE DEFINITIONS
#
###############################################################################

# Define a service to "ping" the local machine

define service {

    use                     local-service           ; Name of service template to use
    host_name               api
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

# Define a service to check SSH on the local machine.
# Disable notifications for this service by default, as not all users may have SSH enabled.

define service {

    use                     local-service           ; Name of service template to use
    host_name               api
    service_description     SSH
    check_command           check_ssh
    notifications_enabled   0
}

# Define a service to check HTTP on the local machine.
# Disable notifications for this service by default, as not all users may have HTTP enabled.

define service {

    use                     local-service           ; Name of service template to use
    host_name               api
    service_description     HTTP
    check_command           check_http
    notifications_enabled   0
}
[11:32]
sudo systemctl restart nagios
[11:32]
ssh-keygen
[11:32]
sur l'api
[11:32]
sudo useradd -s /usr/bin/bash -r -m nagios
[11:32]
sudo su - nagios
[11:33]
umask 0077
mkdir .ssh
cat /tmp/id_rsa.pub > .ssh/authorized_keys
[11:33]
sur nagios
[11:33]
scp /usr/local/nagios/.ssh/id_rsa.pub user1@192.168.186.149:/tmp
[11:33]
ssh 192.168.186.149