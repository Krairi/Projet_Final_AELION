#!/bin/bash
export ORACLE_SID=cdb1
export ORACLE_HOME=/home/oracle/u01/app/oracle/product/19c/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH

# Exécution de la première sauvegarde RMAN
rman target / @ backup_full.rman log backup.log <<EOF
CONFIGURE CONTROLFILE AUTOBACKUP ON;
CONFIGURE RETENTION POLICY TO REDUNDANCY 3;

run {
        alter system switch LOGFILE;
        backup database plus archivelog delete all input;
        delete noprompt obsolete;
}
exit;
EOF

# Exécution de la deuxième sauvegarde RMAN
rman target / @ archive_backup_full.rman log archive_backup.log <<EOF
CONFIGURE CONTROLFILE AUTOBACKUP ON;
CONFIGURE RETENTION POLICY TO REDUNDANCY 3;

run {
        alter system switch LOGFILE;
        backup archivelog all;
        delete noprompt obsolete;
}
exit;
EOF

# Transférer les fichiers de sauvegarde vers le serveur de sauvegarde distant
scp /home/oracle/u01/app/oracle/product/19c/dbhome_1/dbs/*_1_1 djawed@192.168.186.180:/home/djawed/sauvegarde/
