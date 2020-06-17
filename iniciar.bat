@echo off
REM Script e inicializacao do Calima em WSL2
REM Autor: Evandro Begati
REM Uso: iniciar.bat VERSAO_CALIMA

echo Iniciando/Atualizando versao do Calima para %~1

REM Destruir o Tomcat
docker stop tomcat_calima
docker rm tomcat_calima

REM Destruir o Postgres
docker stop postgres_calima
docker rm postgres_calima

REM Baixar nova imagem do Calima
IF "%~1"=="stable" docker pull projetusti/calima:stable
IF "%~1"=="canary" docker pull projetusti/calima:canary

REM Construir uma nova imagem do Calima (testing somente)
IF "%~1"=="testing" git -C .\docker-calima reset --hard origin/testing
IF "%~1"=="testing" git -C .\docker-calima pull origin testing
IF "%~1"=="testing" docker-compose -f testing.yml build

REM Subir Postgres e Calima
IF "%~1"=="stable" docker-compose -f stable.yml up -d postgres_calima
IF "%~1"=="canary" docker-compose -f canary.yml up -d postgres_calima
IF "%~1"=="testing" docker-compose -f canary.yml up -d postgres_calima

timeout /t 10

IF "%~1"=="stable" docker-compose -f stable.yml up -d tomcat_calima
IF "%~1"=="canary" docker-compose -f canary.yml up -d tomcat_calima
IF "%~1"=="testing" docker-compose -f testing.yml up -d tomcat_calima