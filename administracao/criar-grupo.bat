@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Criar grupo do TCC

rem ============================================================
rem  Cria a pasta de um grupo a partir de "modelo".
rem  Uso: duplo clique ou executar em "administracao".
rem
rem  O nome escolhido vira o nome da pasta, o titulo da janela
rem  e o prefixo dos PDFs (TCC-<nome>-v001.pdf). Nao ha nada
rem  para editar depois: o gerar-pdf.bat do grupo le o nome da
rem  propria pasta.
rem ============================================================

set "ADMIN_DIR=%~dp0"
for %%A in ("%ADMIN_DIR%..") do set "RAIZ_DIR=%%~fA"
set "MODELO_DIR=%RAIZ_DIR%\modelo"
set "GRUPOS_DIR=%RAIZ_DIR%\grupos"
set "TYPST_EXE=%RAIZ_DIR%\ferramentas\typst.exe"
set "TEMPLATE_DIR=%RAIZ_DIR%\ferramentas\template"

echo.
echo === Criar grupo do TCC ===
echo Pasta do projeto: "%RAIZ_DIR%"

if not exist "%MODELO_DIR%\main.typ" (
    echo ERRO: pasta-modelo nao encontrada ou incompleta:
    echo "%MODELO_DIR%"
    exit /b 1
)

if not exist "%TYPST_EXE%" (
    echo ERRO: compilador Typst nao encontrado:
    echo "%TYPST_EXE%"
    exit /b 1
)

if not exist "%TEMPLATE_DIR%\tcc-v*.typ" (
    echo ERRO: nenhuma versao do template encontrada em:
    echo "%TEMPLATE_DIR%"
    exit /b 1
)

if not exist "%GRUPOS_DIR%" mkdir "%GRUPOS_DIR%"
if not exist "%GRUPOS_DIR%" (
    echo ERRO: nao foi possivel criar a pasta "grupos".
    exit /b 1
)

set "VAZIO=0"

:pedir
echo.
set "NOME="
set /p "NOME=Nome da pasta do grupo (sem espacos nem acentos): "
if not defined NOME (
    set /a VAZIO+=1
    if !VAZIO! GEQ 3 (
        echo.
        echo ERRO: nenhum nome foi informado.
        exit /b 1
    )
    goto :pedir
)

rem Remove aspas que o usuario possa ter digitado.
set "NOME=!NOME:"=!"

set "INVALIDO="

rem Espaco nao e permitido.
if not "!NOME: =!"=="!NOME!" set "INVALIDO=1"

rem So letras sem acento, numeros, hifen e sublinhado.
for /f "delims=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_" %%A in ("!NOME!") do set "INVALIDO=1"

rem Limite de tamanho, para o nome do PDF nao ficar impraticavel.
if not "!NOME:~40!"=="" set "INVALIDO=1"

rem Nomes reservados do Windows.
for %%R in (CON PRN AUX NUL COM1 COM2 COM3 COM4 COM5 COM6 COM7 COM8 COM9 LPT1 LPT2 LPT3 LPT4 LPT5 LPT6 LPT7 LPT8 LPT9) do (
    if /i "!NOME!"=="%%R" set "INVALIDO=1"
)

rem Nome comecando com ponto ou hifen cria pasta oculta ou confusa.
if "!NOME:~0,1!"=="." set "INVALIDO=1"
if "!NOME:~0,1!"=="-" set "INVALIDO=1"

if defined INVALIDO (
    echo.
    echo ERRO: nome invalido: "!NOME!"
    echo Use apenas letras sem acento, numeros, hifen e sublinhado.
    echo Nao use espacos, acentos, pontos ou barras. Exemplos:
    echo   Grupo-01
    echo   grupo_mecanica
    echo   ianes-3b
    goto :pedir
)

set "DESTINO=%GRUPOS_DIR%\!NOME!"

if exist "!DESTINO!" (
    echo.
    echo ERRO: ja existe a pasta:
    echo "!DESTINO!"
    echo Escolha outro nome ou apague a pasta antes de criar de novo.
    goto :pedir
)

echo.
echo Copiando a pasta-modelo para "%DESTINO%" ...

robocopy "%MODELO_DIR%" "!DESTINO!" /E /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 (
    echo ERRO: nao foi possivel copiar a pasta-modelo.
    exit /b 1
)

if not exist "!DESTINO!\main.typ" (
    echo ERRO: a copia ficou incompleta: "!DESTINO!\main.typ" nao existe.
    exit /b 1
)

if not exist "!DESTINO!\gerar-pdf.bat" (
    echo ERRO: a copia ficou incompleta: "!DESTINO!\gerar-pdf.bat" nao existe.
    exit /b 1
)

echo.
echo SUCESSO: grupo criado em:
echo "!DESTINO!"
echo.
echo Proximos passos:
echo   1. Abra a pasta do grupo e execute "gerar-pdf.bat".
echo      Na primeira compilacao ele pede a versao do template.
echo   2. Preencha "dados.typ" com a identificacao do grupo.
echo   3. Escreva o trabalho nas pastas 01-pre-textuais, 02-textuais
echo      e 03-pos-textuais.
echo.
echo Os PDFs sairao em "saida" com o nome TCC-!NOME!-v001.pdf,
echo depois v002, v003, sem sobrescrever os anteriores.

exit /b 0
