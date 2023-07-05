# Se connecter sur oracle à sysdba
sqlplus / as sysdba
# Donner password à sys
alter user sys identified by password;
# Se connecter sur oracle à sysdba
sqlplus / as sysdba
shutdown immediate;
startup mount;
alter database open;
# se connecter à oracle sql developper avec sys et password
# si il y aune attaque pirate à 15h je peut faire le choix de pas le récupéré après 15h
alter system switch LOGFILE;

select * from v$logfile;
select * from v$log;
select * from v$archived_log;
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

select * from v$database;

alter database archivelog;
# Créer le chemin d'installation du script
mkdir backup
mkdir backup/rman
# Se positionner
cd backup/rman/
# créer un script
vi backup_full.rman

# se connecter à rman
rman target /@backup

