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

MASTER  SUNUCUDA POSTGRESQL.CONF AYARLARI

listen_addresses = '*'
wal_level = logical


ARDINDAN DATABASE OLUSTURMAK

CREATE DATABASE test;
\c test
CREATE TABLE demo_table(id serial, value char(33), primary key(value) ) ;
INSERT INTO demo_table (select generate_series(1,1000),md5(random()::text)) ;

  
  

REPLISKASYON KULLANICISI OLUSTURMAK

CREATE USER ibrahim WITH LOGIN PASSWORD 'rootroot' replication;
GRANT SELECT ON demo_table TO ibrahim ;

  

MASTER  VE REPLIKA SUNUCUDA PGHBA.CONF AYARLARI

host all ibrahim 0.0.0.0/0 md5
  


REPLIKA MAKNİDE YAPILACAKLAR

  
CREATE DATABASE test_replika
\c test_replika


  
TABLO OLUŞTURMAK

CREATE TABLE demo_table(id serial, value char(33), primary key(value) ) ;

SUBSCRIPTION OLUŞTURMAK

CREATE SUBSCRIPTION testsub CONNECTION 'host=master-ip dbname=test user=ibrahim password=rootroot' PUBLICATION pubsqltr ;


SELECT count(*) from demo_table  MASTERDA KI TEST TABLOSUNU CEKTIK


SUBSCRIPTION KOMNUTLARI

SELECT * FROM pg_stat_subscription;  // İZLEMEK
DROP SUBSCRIPTION testsub;
ALTER SUBSCRIPTION testsub ENABLE;
ALTER SUBSCRIPTION testsub DISABLE;




