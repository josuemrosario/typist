@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem ============================================================
rem  Este arquivo deve ser usado na pasta do grupo, dentro de
rem  "grupos". Ao copiar a pasta-modelo, edite as 3 linhas
rem  marcadas com "EDITAR" abaixo.
rem ============================================================

rem [1/3] EDITAR: nome do grupo no titulo da janela
title Geracao de PDF - Grupo-XX

set "GRUPO_DIR=%~dp0"
set "RAIZ_DIR=%GRUPO_DIR%..\.."
set "TYPST_EXE=%RAIZ_DIR%\ferramentas\typst.exe"
set "ENTRADA=%GRUPO_DIR%main.typ"
set "SAIDA_DIR=%GRUPO_DIR%saida"
rem [2/3] EDITAR: prefixo dos PDFs (nome do grupo)
set "PREFIXO=TCC-Grupo-XX-v"
set "LOCK_DIR=%SAIDA_DIR%\.gerar-pdf.lock"

echo.
rem [3/3] EDITAR: nome do grupo na mensagem
echo === Geracao de PDF - Grupo-XX ===
echo Pasta do grupo: "%GRUPO_DIR%"

if not exist "%TYPST_EXE%" (
    echo ERRO: compilador Typst nao encontrado: "%TYPST_EXE%"
    echo Verifique se esta pasta e uma copia dentro de "grupos".
    exit /b 1
)

if not exist "%ENTRADA%" (
    echo ERRO: arquivo de entrada nao encontrado: "%ENTRADA%"
    exit /b 1
)

if not exist "%SAIDA_DIR%" mkdir "%SAIDA_DIR%"
if not exist "%SAIDA_DIR%" (
    echo ERRO: nao foi possivel criar a pasta de saida.
    exit /b 1
)

"%TYPST_EXE%" --version
if errorlevel 1 (
    echo ERRO: nao foi possivel executar o compilador Typst.
    exit /b 1
)

2>nul mkdir "%LOCK_DIR%"
if errorlevel 1 (
    echo ERRO: outra compilacao pode estar em andamento ou existe um bloqueio antigo:
    echo "%LOCK_DIR%"
    echo Verifique antes de remover o bloqueio.
    exit /b 1
)

set "MAX=0"
for %%F in ("%SAIDA_DIR%\%PREFIXO%*.pdf") do (
    if exist "%%~fF" (
        set "NOME=%%~nF"
        set "NUM=!NOME:%PREFIXO%=!"
        set "NUM=!NUM:.pdf=!"
        set /a "NUMVAL=1!NUM!-1000" 2>nul
        if !NUMVAL! GTR !MAX! set "MAX=!NUMVAL!"
    )
)

set /a "PROXIMO=MAX+1"
if !PROXIMO! GTR 999 (
    echo ERRO: limite de 999 versoes atingido; ajuste o esquema de nomes.
    rmdir "%LOCK_DIR%" 2>nul
    exit /b 1
)

set "VERSAO=00!PROXIMO!"
set "VERSAO=!VERSAO:~-3!"
set "ARQUIVO_FINAL=%SAIDA_DIR%\%PREFIXO%!VERSAO!.pdf"
set "ARQUIVO_TEMP=%SAIDA_DIR%\.__temporario_!RANDOM!_!RANDOM!.pdf"

"%TYPST_EXE%" compile "%ENTRADA%" "%ARQUIVO_TEMP%"
if errorlevel 1 (
    echo ERRO: compilacao falhou. Nenhuma versao final foi criada.
    del "%ARQUIVO_TEMP%" 2>nul
    rmdir "%LOCK_DIR%" 2>nul
    exit /b 1
)

if not exist "%ARQUIVO_TEMP%" (
    echo ERRO: o compilador terminou sem criar o PDF temporario.
    rmdir "%LOCK_DIR%" 2>nul
    exit /b 1
)

move /y "%ARQUIVO_TEMP%" "%ARQUIVO_FINAL%" >nul
if errorlevel 1 (
    echo ERRO: nao foi possivel salvar o PDF final.
    del "%ARQUIVO_TEMP%" 2>nul
    rmdir "%LOCK_DIR%" 2>nul
    exit /b 1
)

echo.
echo SUCESSO: PDF criado:
echo "%ARQUIVO_FINAL%"

rmdir "%LOCK_DIR%" 2>nul
exit /b 0
