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
select * from v$database;
alter database archivelog;

-- force redo rotation
alter system switch LOGFILE;

select * from v$logfile;
select * from v$log;
select * from v$archived_log;

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

select current_scn from v$database; -- 3610259  --3611189

alter database archivelog;
# Créer le chemin d'installation du script
mkdir backup
mkdir backup/rman
# Se positionner
cd backup/rman/
# créer un script
vi backup_full.rman # Ajouter : backup database plus archivelog;

# se connecter à rman et lancer le script
rman target / @ backup_full.rman
# Vérifier les variable d'environnement d'oracle
env | grep -i oracle
# se connecter à rman
rman target /
LIST BACKUP of DATABASE;
LIST BACKUP of ARCHIVELOG ALL;
#
