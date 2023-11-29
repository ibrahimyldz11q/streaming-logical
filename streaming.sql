1 master 1 slave oel 8 postres install

2 sunucu içinde postgres kurulumu
  
# Install the repository RPM:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
sudo dnf -qy module disable postgresql

# Install PostgreSQL:
sudo dnf install -y postgresql14-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14


MASTER SUNUCUDA REPLİKASYON USER OLUŞTURMAK

CREATE USER IBRAHIM REPLICATION LOGIN ENCRYTED PASSWORD 'ROOTROOT'
  
  

MASTER SUNUCUYA STANDBYS SUNUCUNUN HOSTUN EKLEMEK
host    replication     IBRAHIM         STANDBY-İP/32         md5


MASTER  SUNUCUDA POSTGRESQL.CONF AYARLARI

listen_addresses = '*'
hot_standby = on
wal_level = replica


SLOT OLUŞTURMAK > SLOT NE İŞE YARAR DERSENİZ

PostgreSQL'de bir replikasyon slot'u oluşturmanın temel amacı, birincil (master) sunucunun Write-Ahead Logging (WAL) verilerini 
bir veya daha fazla ikincil (standby) sunucuya aktarmak ve bu şekilde bir yedekleme (replication) mekanizması sağlamaktır
Replikasyon slot'ları, birincil sunucunun verilerini bir veya birden fazla ikincil sunucuya ileterek yüksek erişilebilirlik sağlar.

SELECT * FROM pg_create_physical_replication_slot('ibrahimtest');  

ARDINDAN RESTART  

sytemctl stop postgresql-14
sytemctl start postgresql-14  
sytemctl status postgresql-14  


STANDBY DATA DİZİNİNDEKİ DOSYARLARIN SİLİNMESİ GERİKİYOR MASTER SUNUCUDAN ÇEKECEĞİZ

MASTER SUNUCUDAKİ DATA DOSYASINI ÇEKMEK

pg_basebackup -D /var/lib/pgsql/14/data/ -R -h master-ipisi -p 5432 -U IBRAHIM

ARDINDAN CONF DOSYASINA MASTER KULLANICI ADI HOSTU VE SLOTU YAZILIR

primary_conninfo = 'host=master-ip port=5432 user=IBRAHIM password=ROOTROOT' 
primary_slot_name = 'ibrahimtest'  
  
ARDINDAN STANDBY POSTGRESQL SERVESINI ÇALIŞTIRIYORUZ   
  
sytemctl start postgresql-14  
sytemctl status postgresql-14  

PSQL BAĞLANARAK  AŞAĞIDAKİ KOMUTUN ÇALIŞTIĞININ DEĞERİNİ T GÖREBİLİRSİNİZ
select pg_is_in_recovery();
  

  
  


  
  



 
