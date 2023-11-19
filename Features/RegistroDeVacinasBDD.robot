*** Settings ***
Library  SeleniumLibrary
Library   OperatingSystem
Resource  ..//StepDefinition/RegistroDeVacinas.resource
Resource  ..//StepDefinition/Pacientes.resource
Resource  ..//StepDefinition/Vacinas.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***

Scenario 1: Aquele que eu busco por todos os pacientes 
    [Tags]    APIGerenciamento    Regressão
     Given Que eu verifico os regitros de vacinação 
     then RegistroDeVacinas.Valido Status code    200

Scenario 2: Aquele que eu registro uma vacinação 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu cadastro um novo paciente
     and Que eu tenha cadastrado uma nova vacina
     and Que eu registro uma nova vacinação
     then RegistroDeVacinas.Valido Status code    200
Scenario 3: Que eu tento vacinar um paciente antes do prazo de prazo
    [Tags]    APIGerenciamento    Regressão
     Given Que eu cadastro um novo paciente
     and Que eu tenha cadastrado uma nova vacina
     and Que eu registro uma nova vacinação antes do prazo
     then RegistroDeVacinas.Valido Status code    400
    