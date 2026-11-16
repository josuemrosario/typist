@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem ============================================================
rem  Este arquivo deve ser usado na pasta do grupo, dentro de
rem  "grupos". Nao ha nada para editar aqui: o nome do grupo e o
rem  nome da pasta em que este arquivo esta.
rem
rem  Crie o grupo com "administracao\criar-grupo.bat".
rem
rem  O tcc.typ desta pasta e gerado por este script, a partir da
rem  versao escolhida em ferramentas\template. Nao edite o
rem  tcc.typ do grupo: ele e sobrescrito a cada compilacao.
rem ============================================================

set "GRUPO_DIR=%~dp0"
set "RAIZ_DIR=%GRUPO_DIR%..\.."
set "TYPST_EXE=%RAIZ_DIR%\ferramentas\typst.exe"
set "ENTRADA=%GRUPO_DIR%main.typ"
set "SAIDA_DIR=%GRUPO_DIR%saida"

rem O nome do grupo e o nome desta pasta.
for %%A in ("%GRUPO_DIR:~0,-1%") do set "NOME_GRUPO=%%~nxA"
if not defined NOME_GRUPO (
    echo ERRO: nao foi possivel identificar o nome da pasta do grupo.
    exit /b 1
)
title Geracao de PDF - !NOME_GRUPO!
set "PREFIXO=TCC-!NOME_GRUPO!-v"
set "LOCK_DIR=%SAIDA_DIR%\.gerar-pdf.lock"
set "TEMPLATE_DIR=%RAIZ_DIR%\ferramentas\template"
set "ARQ_TCC=%GRUPO_DIR%tcc.typ"
set "ARQ_ESCOLHA=%GRUPO_DIR%template-usado.txt"
set "HISTORICO=%SAIDA_DIR%\historico.txt"

echo.
echo === Geracao de PDF - !NOME_GRUPO! ===
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

set "VERSAO_TYPST="
for /f "usebackq delims=" %%V in (`"%TYPST_EXE%" --version 2^>nul`) do set "VERSAO_TYPST=%%V"
if not defined VERSAO_TYPST (
    echo ERRO: nao foi possivel executar o compilador Typst.
    exit /b 1
)
echo !VERSAO_TYPST!

rem A fonte do trabalho fica em ferramentas\fontes. Sem ela o Typst
rem compila com outra fonte e ainda assim informa sucesso.
set "FONTES_DIR=%RAIZ_DIR%\ferramentas\fontes"
if not exist "%FONTES_DIR%\arial.ttf" (
    echo ERRO: a fonte Arial nao foi encontrada em "%FONTES_DIR%"
    echo Verifique se a pasta ferramentas esta na raiz e se os arquivos
    echo arial.ttf, arialbd.ttf, ariali.ttf e arialbi.ttf estao presentes.
    exit /b 1
)
"%TYPST_EXE%" fonts --font-path "%FONTES_DIR%" --ignore-system-fonts 2>nul | findstr /b /c:"Arial" >nul
if errorlevel 1 (
    echo ERRO: o Typst nao conseguiu ler a fonte Arial de "%FONTES_DIR%"
    echo O PDF sairia com outra fonte. Verifique os arquivos arial*.ttf.
    exit /b 1
)

rem ---------- Versoes do template ----------
if not exist "%TEMPLATE_DIR%" (
    echo ERRO: pasta de versoes do template nao encontrada:
    echo "%TEMPLATE_DIR%"
    exit /b 1
)

set "N=0"
for %%F in ("%TEMPLATE_DIR%\tcc-v*.typ") do (
    if exist "%%~fF" (
        set /a N+=1
        set "ARQ_!N!=%%~fF"
        set "COD=%%~nF"
        set "COD=!COD:tcc-v=!"
        set "VER_!N!=!COD!"
    )
)

if !N! EQU 0 (
    echo ERRO: nenhuma versao do template encontrada em:
    echo "%TEMPLATE_DIR%"
    echo Esperado: arquivos tcc-v001.typ, tcc-v002.typ, ...
    exit /b 1
)

rem A primeira linha de cada versao descreve data e assunto, no
rem formato "// v001 | data | descricao". Remove o prefixo "//"
rem (e o BOM, se o arquivo tiver) para o menu ficar limpo.
echo.
echo Versoes do template disponiveis:
for /l %%I in (1,1,!N!) do (
    set "LINHA="
    for /f "usebackq delims=" %%L in ("!ARQ_%%I!") do if not defined LINHA set "LINHA=%%L"
    set "LINHA=!LINHA:*//=!"
    if "!LINHA:~0,1!"==" " set "LINHA=!LINHA:~1!"
    if not defined LINHA set "LINHA=v!VER_%%I!"
    echo   %%I - !LINHA!
)
rem Mapa de entrada -> indice. Aceita o numero da lista (1, 2, ...)
rem e o codigo da versao (v001, 001 ou 1).
for /l %%I in (1,1,!N!) do (
    set "IDX_%%I=%%I"
    set "IDX_!VER_%%I!=%%I"
    set "SEMZERO=!VER_%%I!"
    if "!SEMZERO:~0,1!"=="0" set "SEMZERO=!SEMZERO:~1!"
    if "!SEMZERO:~0,1!"=="0" set "SEMZERO=!SEMZERO:~1!"
    set "IDX_!SEMZERO!=%%I"
)

rem Versao usada na ultima compilacao deste grupo.
set "ATUAL="
if exist "%ARQ_ESCOLHA%" (
    for /f "usebackq delims=" %%L in ("%ARQ_ESCOLHA%") do if not defined ATUAL set "ATUAL=%%L"
)
rem Com a variavel vazia, "!ATUAL:v=!" nao expande e vira texto
rem literal; por isso a troca so acontece quando ha valor.
if defined ATUAL (
    set "ATUAL=!ATUAL:v=!"
    set "ATUAL=!ATUAL:V=!"
)
if defined ATUAL (
    set "EXISTE="
    for /l %%I in (1,1,!N!) do if "!VER_%%I!"=="!ATUAL!" set "EXISTE=1"
    if not defined EXISTE (
        echo.
        echo AVISO: a versao v!ATUAL! usada antes nao existe mais.
        set "ATUAL="
    )
)
if defined ATUAL (
    echo.
    echo Versao usada na ultima compilacao: v!ATUAL!
)

rem Padrao: a versao usada antes; na primeira vez, a de numero
rem mais alto.
set "PADRAO_IDX="
if defined ATUAL set "PADRAO_IDX=!IDX_%ATUAL%!"
if not defined PADRAO_IDX set "PADRAO_IDX=!N!"
set "PADRAO_COD=!VER_%PADRAO_IDX%!"

set "TENT=0"

:escolher
rem O limite fica fora de blocos: "exit /b" dentro de parenteses
rem aninhados nao propaga o codigo de saida de forma confiavel.
if !TENT! GEQ 5 (
    echo.
    echo ERRO: nenhuma versao valida foi escolhida. Nada foi compilado.
    exit /b 1
)
echo.
set "ESCOLHA="
set /p "ESCOLHA=Escolha o numero da versao [Enter = %PADRAO_IDX% (v%PADRAO_COD%)]: "

rem EOF ou Enter: usa o padrao.
if not defined ESCOLHA (
    set "ESCOLHA=%PADRAO_IDX%"
)

rem Remove espacos e o "v" que o usuario possa ter digitado.
set "ESCOLHA=!ESCOLHA: =!"
set "ESCOLHA=!ESCOLHA:v=!"
set "ESCOLHA=!ESCOLHA:V=!"

rem So aceita digitos: evita que a entrada quebre o comando.
set "INVALIDO="
for /f "delims=0123456789" %%A in ("!ESCOLHA!") do set "INVALIDO=1"

set "IDX="
if not defined INVALIDO set "IDX=!IDX_%ESCOLHA%!"

if not defined IDX (
    set /a TENT+=1
    echo Valor invalido: "!ESCOLHA!". Digite o numero da lista.
    goto :escolher
)

set "VER=!VER_%IDX%!"
set "ARQ_VER=!ARQ_%IDX%!"

rem O bloqueio vem antes de gerar o tcc.typ: se outra compilacao
rem estiver em andamento, o tcc.typ dela nao pode ser trocado no
rem meio do caminho.
if exist "%LOCK_DIR%" (
    echo ERRO: outra compilacao pode estar em andamento ou existe um bloqueio antigo:
    echo "%LOCK_DIR%"
    echo Verifique antes de remover o bloqueio.
    exit /b 1
)
2>nul mkdir "%LOCK_DIR%"
if not exist "%LOCK_DIR%" (
    echo ERRO: nao foi possivel criar o bloqueio de compilacao:
    echo "%LOCK_DIR%"
    exit /b 1
)

rem Gera o tcc.typ do grupo a partir da versao escolhida. Grava
rem primeiro em arquivo temporario e so substitui quando o
rem conteudo do template esta de fato presente: assim uma falha
rem de copia nao deixa o grupo com um tcc.typ incompleto.
set "TCC_TEMP=%GRUPO_DIR%.__tcc_!RANDOM!.tmp"
> "%TCC_TEMP%" echo // GERADO pelo gerar-pdf.bat a partir de tcc-v!VER!.typ - nao edite
type "%ARQ_VER%" >> "%TCC_TEMP%"
findstr /c:"#let configurar" "%TCC_TEMP%" >nul 2>nul
if not "!errorlevel!"=="0" (
    del "%TCC_TEMP%" 2>nul
    rmdir "%LOCK_DIR%" 2>nul
    echo ERRO: nao foi possivel gerar "%ARQ_TCC%".
    echo Verifique a versao v!VER! em "%ARQ_VER%".
    exit /b 1
)
move /y "%TCC_TEMP%" "%ARQ_TCC%" >nul
if not exist "%ARQ_TCC%" (
    del "%TCC_TEMP%" 2>nul
    rmdir "%LOCK_DIR%" 2>nul
    echo ERRO: nao foi possivel gravar "%ARQ_TCC%".
    exit /b 1
)
> "%ARQ_ESCOLHA%" echo v!VER!

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

rem Usa apenas a fonte do projeto, para o PDF sair igual em qualquer
rem computador (ver a verificacao da Arial acima). A versao do
rem template vai nos metadados do PDF (--input).
"%TYPST_EXE%" compile "%ENTRADA%" "%ARQUIVO_TEMP%" --font-path "%FONTES_DIR%" --ignore-system-fonts --input "versao-template=v!VER!"
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

rem Registra a compilacao no historico do grupo.
set "AGORA="
for /f "usebackq delims=" %%D in (`powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm'" 2^>nul`) do set "AGORA=%%D"
if not defined AGORA set "AGORA=%DATE% %TIME%"
for %%A in ("%ARQUIVO_FINAL%") do set "NOME_PDF=%%~nxA"
>> "%HISTORICO%" echo !AGORA!  !NOME_PDF!  template v!VER!  !VERSAO_TYPST!

echo.
echo SUCESSO: PDF criado:
echo "%ARQUIVO_FINAL%"
echo Template usado: v!VER!

rmdir "%LOCK_DIR%" 2>nul
exit /b 0
