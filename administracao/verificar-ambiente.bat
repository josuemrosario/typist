
@echo off
setlocal
title Diagnostico do ambiente Typst

echo.
echo === Diagnostico Typst - Tutorial 2 ===

rem Localiza a raiz do projeto a partir da pasta administracao.
set "ADMIN_DIR=%~dp0"
set "RAIZ_DIR=%ADMIN_DIR%.."
set "TYPST_EXE=%RAIZ_DIR%\ferramentas\typst.exe"
set "MODELO=%RAIZ_DIR%\modelo\tcc.typ"
set "GRUPO_DIR=%RAIZ_DIR%\grupos\Grupo-01"
set "ENTRADA=%GRUPO_DIR%\main.typ"

rem Verifica se o compilador existe.
if not exist "%TYPST_EXE%" (
    echo ERRO: compilador Typst nao encontrado:
    echo "%TYPST_EXE%"
    exit /b 1
)

rem Mostra a versao instalada.
"%TYPST_EXE%" --version
if errorlevel 1 (
    echo ERRO: nao foi possivel executar o Typst.
    exit /b 1
)

rem Verifica os arquivos esperados.
if not exist "%MODELO%" (
    echo AVISO: template central nao encontrado:
    echo "%MODELO%"
)

if not exist "%ENTRADA%" (
    echo AVISO: arquivo main.typ do Grupo-01 nao encontrado:
    echo "%ENTRADA%"
)

echo.
echo Diagnostico concluido.
echo Este script nao compila o trabalho.
exit /b 0
