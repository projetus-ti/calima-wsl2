# Calima para WSL2

Scripts para manipulação do Calima ERP Contábil no WSL2 do Windows 10 (Versão 2004)


# Passos para instalação

* Instale o WSL2: [https://docs.microsoft.com/pt-br/windows/wsl/install-win10](https://docs.microsoft.com/pt-br/windows/wsl/install-win10 "https://docs.microsoft.com/pt-br/windows/wsl/install-win10")
* Desative os serviços Calima Server e Postgres , caso existentes.
* Instale o Docker para Windows: [https://hub.docker.com/editions/community/docker-ce-desktop-windows/](https://hub.docker.com/editions/community/docker-ce-desktop-windows/ "https://hub.docker.com/editions/community/docker-ce-desktop-windows/")
* Clone este projeto em C:\desenvol\calima
* Exclua o arquivo: C:\desenvol\calima\postgres\data\.nodelete
* Clone o projeto de imagem do Calima: 
	* cd c:\desenvol\calima 
	* git clone https://github.com/projetus-ti/docker-calima.git

## Utilização

* Entre no diretório C:\calima\desenvol pelo cmd, Powershell ou Windows Terminal
* iniciar.bat [stable/canary/testing] - Para baixar/construir a imagem mais nova do sistema e iniciar os serviços.
* parar.bat - Parar todos os serviços do sistema.
* restaurar_banco.bat - Restaura backup: renomeie o arquivo para calima.backup e mova-o para c:\desenvol\calima\postgres\bkp, antes de executar esse script.