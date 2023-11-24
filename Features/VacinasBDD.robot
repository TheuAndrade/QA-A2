*** Settings ***
Library  SeleniumLibrary
Library   OperatingSystem
Resource  ..//StepDefinition/Vacinas.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***

######################################### VACINAS #############################################
Scenario 1: Aquele que eu chamo vejo todas as vacinas cadastradas
    [Tags]    APIVacinas    Regressão
    Given Chamando todas as vacinas 
    then Valido Status code    200
    
Scenario 2: Aquele que eu cadastro uma vacina 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina
    then Valido Status code    201

Scenario 3: Aquele que eu tento cadastrar uma vacina proxima com menos de 1 dia de validade 
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina proxima do vencimento
    then Valido Status code    422

Scenario 4: Aquele que eu tento cadastradas uma vacina fora da validade
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina fora da validade
    then Valido Status code    422

Scenario 5: Aquele que eu tento cadastrar duas vacinas iguais 
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina fora da validade
    then Valido Status code    422

# Scenario 3: Aquele que eu tento cadastrar uma vacina sem codigo
#     [Tags]    APIVacinas    Regressão    Negativo
#     Given Que eu tento cadastrar uma nova vacina sem codigo
#     And Eu tento cadastrar a mesma vacina
#     then Valido Status code    400

# Scenario 3: Aquele que eu tento cadastrar uma vacina com codigo negativo
#     [Tags]    APIVacinas    Regressão    Negativo
#     Given Que eu tento cadastrar uma nova vacina com codigo negativo
#     And Eu tento cadastrar a mesma vacina
#     then Valido Status code    400

Scenario 6: Aquele que eu tento cadastrar uma vacina sem nome
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina sem nome
    then Valido Status code    422

Scenario 7: Aquele que eu tento cadastrar uma vacina sem fabricante
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina sem fabricante
    then Valido Status code    422

Scenario 8: Aquele que eu tento cadastrar uma vacina sem lote
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina sem lote
    then Valido Status code    422

Scenario 9: Aquele que eu tento cadastrar uma vacina com lote negativo
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina com lote negativo
    then Valido Status code    422

Scenario 10: Aquele que eu tento cadastrar uma vacina sem validade
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina sem validade
    then Valido Status code    422

Scenario 11: Aquele que eu tento cadastrar uma vacina sem intervalo entre doses
    [Tags]    APIVacinas    Regressão    
    Given Que eu tento cadastrar uma nova vacina sem intervalo entre doses
    then Valido Status code   422

Scenario 12: Aquele que eu tento cadastrar uma vacina com intervalo entre doses negativo
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina com intervalo de doses negativo
    then Valido Status code    422



###########################################     PUT     #############################################################

Scenario 13: Aquele que eu atualizo os dados de uma vacina
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina
    then Valido Status code    200

Scenario 14: Aquele que eu atualizo os dados de uma vacina e removo o nome 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo o nome
    then Valido Status code    422

Scenario 15: Aquele que eu atualizo os dados de uma vacina e removo o fabricante
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo o fabricante 
    then Valido Status code    422

Scenario 16: Aquele que eu atualizo os dados de uma vacina e removo o lote
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo o lote 
    then Valido Status code    422

Scenario 17: Aquele que eu atualizo os dados de uma vacina e passo um lote negativo 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e passo um lote negativo 
    then Valido Status code    422

Scenario 18: Aquele que eu atualizo os dados de uma vacina e removo a validade 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo a validade 
    then Valido Status code    422

Scenario 19: Aquele que eu atualizo os dados de uma vacina e informo uma validade vencina 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e inforo uma valdiade vencida
    then Valido Status code    422

Scenario 20: Aquele que eu atualizo os dados de uma vacina e removo a quantidade de doses 
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo a quantidade de doses
    then Valido Status code    422

Scenario 21: Aquele que eu atualizo os dados de uma vacina e informo uma dose negativa
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e passo uma dose negativa
    then Valido Status code    422

Scenario 22: Aquele que eu atualizo os dados de uma vacina e removo o intervalo entre dose
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e removo o intervalo entre dose
    then Valido Status code    200

Scenario 23: Aquele que eu atualizo os dados de uma vacina e passo um intervalo entre doses negativo
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina e passo um intervalo entre doses negativo 
    then Valido Status code    422



##########################################   DELETE   #############################################

Scenario 24: Aquele que eu deleto uma vacina 
    [Tags]    APIVacinas    Regressão    
    Given Que eu tenha cadastrado uma nova vacina
    and Que eu deleto a vacina criada 
    then Valido Status code    200

Scenario 25: Aquele que eu deleto uma vacina por ID 
     [Tags]    
    Given Que eu deleto uma vacina com ID =   65594784b4fae46e52904f61  
    then Valido Status code    422

Scenario 26: Que eu deleto multipas vacinas
    Given Que eu deleto multipas vacinas    655e80aa74a1943cc79f4998
     