@echo off
REM Script de restauracao de banco do Calima em WSL2
REM Autor: Evanro Begati
REM Uso: parar.bat

REM Parar o Tomcat
docker stop tomcat_calima

REM Destruir o Tomcat
docker rm tomcat_calima

REM Parar o Postgres
docker stop postgres_calima

REM Destruir o Postgres
docker rm postgres_calima