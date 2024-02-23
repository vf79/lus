@echo off

chcp 65001
set name="lum" "lus"

if "%1"=="--clean" goto clean
if "%1"=="--docs" goto docs
if "%1"=="--env" goto env
if "%1"=="--execute" goto execute
if "%1"=="--formate" goto formate
if "%1"=="--install" goto install
if "%1"=="--install-all" goto install-all
if "%1"=="--install-dev" goto install-dev
if "%1"=="--install-docs" goto install-docs
if "%1"=="--install-lint" goto install-lint
if "%1"=="--install-test" goto install-test
if "%1"=="--lint" goto lint
if "%1"=="--test" goto test
if "%1"=="--test-debug" goto test-debug
if "%1"=="--test-run" goto test-run
goto help

:clean
    set list-dirs=build dist htmlcov site
    set r_list_dirs=__pycache__ *.egg-info
    set files=*.pyc .coverage
    echo "Excluindo arquivos e diretorios desnecessários..."
    for /r . %%f in (%files%) do @if exist "%%f" del "%%f"
    for /d /r . %%d in (%r_list_dirs%) do @if exist "%%d" rd /s /q "%%d"
    for %%a  in (%list-dirs%) do @if exist "%%a" rd /s /q "%%a"
goto end

:docs
    echo "Mkdocs criando arquivos de documentação..."
    mkdocs build --clean
goto end

:env
    echo "Para setar variáveis de ambiente em powershell use:"
    echo "[System.Environment]::SetEnvironmentVariable('<variavel>','<valor>')"
    echo "Para exibir as variaveis de ambiente em powershell use:"
    echo "dir env:<variavel> ou dir env: para exibir todas as variaveis"
goto end

:execute
    echo "Para executar a aplicação no terminal digite:"
goto end

:formate
    echo "Formatando o codigo..."
    isort .
    black -l 79 .
goto end

:install
    echo "Instalando dependências..."
    pip install -e .
goto end

:install-all
    echo "Instalando todas as dependências..."
    pip install -e .[dev,docs,lint,test]

:install-dev
    echo "Instalando dependências de desenvolvimento..."
    pip install -e .[dev]
goto end

:install-docs
    echo "Instalando dependências de documentação..."
    pip install -e .[doc]
goto end

:install-lint
    echo "Instalando dependências de linter..."
    pip install -e .[lint]
goto end

:install-test
    echo "Instalando dependências de testes..."
    pip install -e .[test]
goto end

:lint
    echo "Verificando qualidade do codigo..."
    .\.venv\Scripts\python -m pflake8
goto end

:test
    echo "Executando testes..."
    pytest tests\ -vv --cov=%name%
    coverage html
goto end

:test-debug
    echo "Executando testes com debug..."
    pytest tests\ -vv --pdb --pdbcls=IPython.terminal.debugger:Pdb -s
goto end

:test-run
    echo "Executando testes selecionado..."
    pytest tests\ -m run -vv --cov=%name%
    coverage html
goto end

:help
    echo "Utilize .\run.cmd --<parametro>"
    echo "Parâmetros:"
    echo "clean - Limpa o codigo"
    echo "docs - Cria a documentação com mkdocs"
    echo "env - Exibe informações para configurar environment"
    echo "execute - Exibe o comando para executar o app"
    echo "formate - Formata o codigo em 80 colunas"
    echo "install - Instala dependências"
    echo "install-all - Instala todas as dependências:[dev,docs,lint,test]"
    echo "install-dev - Instala dependências de desenvolvimento"
    echo "install-docs - Instala dependências de documentação"
    echo "install-lint - Instala dependências de lint"
    echo "install-test - Instalac dependências de testes"
    echo "lint - Executa varreduras de qualidade de formatacao de codigo"
    echo "test - Executa testes"
    echo "test-debug - Executa testes com debug ipdb"
    echo "test-run - Executa teste selecionado com marker run"

:end
    echo "Script finalizado."
