@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Diagnostico do ambiente Typst

rem ============================================================
rem  Diagnostico somente leitura: nao compila e nao altera nada.
rem  Confere o compilador, as fontes, as versoes do template, a
rem  pasta-modelo e os grupos existentes.
rem ============================================================

set "ADMIN_DIR=%~dp0"
for %%A in ("%ADMIN_DIR%..") do set "RAIZ_DIR=%%~fA"
set "TYPST_EXE=%RAIZ_DIR%\ferramentas\typst.exe"
set "FONTES_DIR=%RAIZ_DIR%\ferramentas\fontes"
set "TEMPLATE_DIR=%RAIZ_DIR%\ferramentas\template"
set "MODELO_DIR=%RAIZ_DIR%\modelo"
set "GRUPOS_DIR=%RAIZ_DIR%\grupos"
set "FALHAS=0"

echo.
echo === Diagnostico do ambiente Typst ===
echo Pasta do projeto: "%RAIZ_DIR%"

rem ---------- 1. compilador ----------
echo.
echo --- Compilador ---
if not exist "%TYPST_EXE%" (
    echo [FALHA] compilador nao encontrado: "%TYPST_EXE%"
    set /a FALHAS+=1
) else (
    set "VERSAO="
    for /f "usebackq delims=" %%V in (`"%TYPST_EXE%" --version 2^>nul`) do if not defined VERSAO set "VERSAO=%%V"
    if defined VERSAO (
        echo [OK] !VERSAO!
    ) else (
        echo [FALHA] o compilador existe mas nao executa.
        set /a FALHAS+=1
    )
)

rem ---------- 2. fontes ----------
echo.
echo --- Fontes (Arial) ---
set "FONTES_OK=1"
for %%F in (arial.ttf arialbd.ttf ariali.ttf arialbi.ttf) do (
    if exist "%FONTES_DIR%\%%F" (
        echo [OK] %%F
    ) else (
        echo [FALHA] ausente: "%FONTES_DIR%\%%F"
        set "FONTES_OK=0"
    )
)
if "!FONTES_OK!"=="1" (
    if exist "%TYPST_EXE%" (
        "%TYPST_EXE%" fonts --font-path "%FONTES_DIR%" --ignore-system-fonts 2>nul | findstr /b /c:"Arial" >nul
        if errorlevel 1 (
            echo [FALHA] o Typst nao conseguiu ler a Arial de "%FONTES_DIR%".
            echo         O PDF sairia com outra fonte.
            set "FONTES_OK=0"
        ) else (
            echo [OK] o Typst le a Arial da pasta do projeto.
        )
    )
)
if not "!FONTES_OK!"=="1" set /a FALHAS+=1

rem ---------- 3. versoes do template ----------
echo.
echo --- Versoes do template ---
if not exist "%TEMPLATE_DIR%" (
    echo [FALHA] pasta nao encontrada: "%TEMPLATE_DIR%"
    set /a FALHAS+=1
) else (
    set "N_VER=0"
    for %%F in ("%TEMPLATE_DIR%\tcc-v*.typ") do (
        if exist "%%~fF" (
            set /a N_VER+=1
            set "LINHA="
            for /f "usebackq delims=" %%L in ("%%~fF") do if not defined LINHA set "LINHA=%%L"
            set "LINHA=!LINHA:*//=!"
            if "!LINHA:~0,1!"==" " set "LINHA=!LINHA:~1!"
            echo [OK] %%~nxF  !LINHA!
        )
    )
    if !N_VER! EQU 0 (
        echo [FALHA] nenhuma versao encontrada. Esperado: tcc-v001.typ
        set /a FALHAS+=1
    ) else (
        echo [OK] total de versoes disponiveis: !N_VER!
    )
)

rem ---------- 4. pasta-modelo ----------
echo.
echo --- Pasta-modelo ---
if not exist "%MODELO_DIR%" (
    echo [FALHA] pasta nao encontrada: "%MODELO_DIR%"
    set /a FALHAS+=1
) else (
    for %%F in (main.typ dados.typ gerar-pdf.bat LEIA-ME.txt) do (
        if exist "%MODELO_DIR%\%%F" (
            echo [OK] %%F
        ) else (
            echo [FALHA] ausente: "%MODELO_DIR%\%%F"
            set /a FALHAS+=1
        )
    )
)

rem ---------- 5. grupos ----------
echo.
echo --- Grupos ---
if not exist "%GRUPOS_DIR%" (
    echo [AVISO] a pasta "grupos" ainda nao existe.
) else (
    set "TEM_GRUPO="
    for /d %%G in ("%GRUPOS_DIR%\*") do (
        set "TEM_GRUPO=1"
        echo.
        echo Grupo: %%~nxG
        if exist "%%~fG\main.typ" (
            echo   [OK] main.typ
        ) else (
            echo   [FALHA] main.typ ausente
            set /a FALHAS+=1
        )
        if exist "%%~fG\gerar-pdf.bat" (
            echo   [OK] gerar-pdf.bat
        ) else (
            echo   [FALHA] gerar-pdf.bat ausente
            set /a FALHAS+=1
        )
        if exist "%%~fG\tcc.typ" (
            echo   [OK] tcc.typ presente
        ) else (
            echo   [AVISO] tcc.typ ainda nao gerado; sera criado na primeira compilacao.
        )
        set "USADO=(nao definida)"
        if exist "%%~fG\template-usado.txt" (
            set "LINHA2="
            for /f "usebackq delims=" %%L in ("%%~fG\template-usado.txt") do if not defined LINHA2 set "LINHA2=%%L"
            if defined LINHA2 set "USADO=!LINHA2!"
        )
        echo   Versao do template usada: !USADO!
        set "NP="
        for %%P in ("%%~fG\saida\*.pdf") do set "NP=1"
        if defined NP (
            set "TOTAL=0"
            for %%P in ("%%~fG\saida\*.pdf") do set /a TOTAL+=1
            echo   PDFs em saida: !TOTAL!
        ) else (
            echo   [AVISO] nenhum PDF gerado ainda.
        )
    )
    if not defined TEM_GRUPO echo [AVISO] nenhum grupo criado ainda.
)

echo.
if !FALHAS! EQU 0 (
    echo Diagnostico concluido sem falhas.
    echo Este script nao compila o trabalho.
    exit /b 0
)
echo Diagnostico concluido com !FALHAS! falha. Corrija antes de compilar.
exit /b 1
