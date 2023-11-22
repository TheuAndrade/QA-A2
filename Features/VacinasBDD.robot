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

Scenario 3: Aquele que eu tento cadastradas uma vacina fora da validade
    [Tags]    APIVacinas    Regressão    Negativo
    Given Que eu tento cadastrar uma nova vacina fora da validade
    then Valido Status code    400
    
Scenario 4: Aquele que eu atualizo os dados de uma vacina
    [Tags]    APIVacinas    Regressão
    Given Que eu tenha cadastrado uma nova vacina 
    and Que eu atualizo os dados da vacina
    then Valido Status code    200

Scenario 5: Aquele que eu deleto uma vacina 
    [Tags]    APIVacinas    Regressão    
    Given Que eu tenha cadastrado uma nova vacina
    and Que eu deleto a vacina criada 
    then Valido Status code    200

Scenario 6: Aquele que eu deleto uma vacina por ID 
     [Tags]    
    Given Que eu deleto uma vacina com ID =    65594784b4fae46e52904f61  
    then Valido Status code    200

Scenario 7: Que eu deleto multipas vacinas
    Given Que eu deleto multipas vacinas    655d238e78bc7d657106dfb9    655d1ec978bc7d657106dfb4            