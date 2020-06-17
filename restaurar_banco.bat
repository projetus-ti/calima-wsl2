@echo off
REM Script de restauracao de banco do Calima em WSL2
REM Autor: Evanro Begati
REM Uso: restaurar_banco.bat

REM Parar o Tomcat
docker stop tomcat_calima

REM Dropar o banco Calima
docker exec -t postgres_calima sh -c "psql -U postgres -c 'drop database calima'"

REM Criar um novo banco Calima
docker exec -t postgres_calima sh -c "psql -U postgres -c 'create database calima'"

REM Restaurar o backup
docker exec -t postgres_calima sh -c "pg_restore -U postgres -v --dbname calima /opt/bkp/calima.backup"

REM Rodar SQLs
docker exec -t postgres_calima sh -c "psql -U postgres -c -d calima -f /opt/sql/ajuste.sql"
docker exec -t postgres_calima sh -c "psql -U postgres -c -d calima -f /opt/sql/versao.sql"

REM Iniciar o Tomcat
docker start tomcat_calima