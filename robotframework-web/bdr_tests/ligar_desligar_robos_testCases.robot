*** Settings ***
Resource         ../bdr_resources/ligar_desligar_robos_resources.robot
Resource         ../bdr_resources/BDDpt-br.robot
Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador


*** Test Cases ***
Cenário 01: Criar robô Tangram - modo simulado
    Dado que estou logado
    Quando eu clico em criar robôs Tangram
    Então devo conseguir criar um robô com sucesso

Cenário 02: Desligar robô Tangram - modo simulado
    Dado que estou na aba de parâmetros do robô
    Quando eu clico no botão de parar robô
    Então o robô deve ser parado com sucesso

Cenário 03: Criar robô Price Action - modo simulado
    Dado que estou logado
    Quando eu clico em criar robôs Price Action
    Então devo conseguir criar um robô com sucesso

Cenário 04: Desligar robô Price Action - modo simulado
    Dado que estou na aba de parâmetros do robô
    Quando eu clico no botão de parar robô
    Então o robô deve ser parado com sucesso

#Cenário 05: Criar robô grátis - modo simulado
 #   Dado que estou logado
 #   Quando eu clico em criar robôs
 #   Então devo conseguir criar um robô grátis com sucesso

#Cenário 05: Criar robô Bovespa - modo simulado
 #   Dado que estou logado
 #   Quando eu clico em criar robôs
#    Então devo conseguir criar um robô Bovespa com sucesso

#Cenário 02: Desligar robô grátis - modo simulado
#    Dado que estou na aba de parâmetros do robô
#    Quando eu clico no botão de parar robô
#    Então o robô deve ser parado com sucesso