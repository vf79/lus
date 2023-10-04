# License User Statistic

## Sobre

Aplicativo para gerar estatisticas de uso de licenças concorrentes.

## Tabela de Conteúdos

* [Sobre](#sobre)
* [Tabela de conteúdos](#tabela-de-conteúdos)
* [Status do projeto](#status-do-projeto)
* [Recursos](#recursos)
* [Pré-requisitos](#pré-requisitos)
* [Dependências](#dependências)
* [Tecnologias](#tecnologias)
* [Testes](#testes)
* [Desenvolvimento](#desenvolvimento)
* [Deploy](#deploy)
* [Código de Conduta](#código-de-conduta)
* [Contribuindo](#contribuindo)
* [Autor](#autor)
* [Licença](#licença)

## Status do projeto

Em desenvolvimento

### Recursos

- [ ] Aplicacao Base
- [ ] Levantamento/Monitoramento
- [ ] Armazenamento de dados
- [ ] Tratamento de dados
- [ ] Relatorios
- [ ] Autenticação

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Python](https://python.org).
Para o python utilizo o pacote [Winpython](https://winpython.github.io/).
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

### Dependências

#### Utilizando Powershell

Acessar o diretório da aplicação

```powershell
cd lus
```

Instalar o Ambiente virtual python VirtualEnv

```powershell
python -m venv .venv --upgrade-deps
```

Habilitar o ambiente virtual python

```powershell
.venv\Script\activate
```

Instalar as dependências do projeto:

```powershell
.\run.cmd --install
```

Instalar as dependências de desenvolvimento do projeto:

```powershell
.\run.cmd --install-dev
```

Instalar as dependências de testes do projeto:

```powershell
.\run.cmd --install-test
```

Instalar as dependências de qualidade do projeto:

```powershell
.\run.cmd --install-lint
```

#### Gerar Secret Key

Para gerar o secret key da aplicação usando python execute:

```python
import secrets
secrets.token_urlsafe(32)
```

Inserir a chave gerada no arquivo .secrets.toml

#### Extras

Se o powershell não estiver permissão de execução,
Para ver as permissões execute:

```powershell
Get-ExecutionPolicy -List
```

Para alterar as permissões execute o powershell no modo administrador e execute:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

### Tecnologias

[Python](https://python.org)

[PostgreSQL](https://www.postgresql.org/)

[SqlAlchemy](https://www.sqlalchemy.org/)

### Testes

Para realizar testes, alterar a constante env do arquivo settings.toml para "testing"

#### Utilizando Powershell

Para realizar os testes:

```powershell
.\run.cmd --test
```

Para ver o relatório de testes em html:
Abrir no navegador o arquivo index.html da pasta htmlcov

### Desenvolvimento

Para rodar o programa:

```powershell

```

### Deploy

#### Em ambiente de Desenvolvimento

## Código de Conduta

[Código de Conduta](./code_of_conduct.md)

## Contribuindo

[Contribuindo](./contribute.md)

## Autor

[Valmir França](https://vf79.com.br)

## Licença

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-green.svg)](./license.md)