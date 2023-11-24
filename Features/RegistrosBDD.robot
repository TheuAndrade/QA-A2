*** Settings ***
Library  SeleniumLibrary
Library   OperatingSystem
Resource  ..//StepDefinition/Registros.resource
Resource  ..//StepDefinition/Pacientes.resource
Resource  ..//StepDefinition/Vacinas.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***


##########################################################    REGISTRO DE VACINAS     ##################################################################################
Scenario 1: Aquele que eu busco por todos os registros de vacina
    [Tags]    APIGerenciamento    Regressão
     Given Que eu verifico os regitros de vacinação 
     then Registros.Valido Status code    200

Scenario 2: Aquele que eu registro uma vacinação 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu cadastro um novo paciente 
     and Que eu registro um novo profissional da saude
     and Vacinas.Que eu tenha cadastrado uma nova vacina
     and Que eu registro uma nova vacinação
     then Registros.Valido Status code    200
Scenario 3: Que eu tento vacinar um paciente antes do prazo de prazo
    [Tags]    APIGerenciamento    Regressão
     Given Que eu cadastro um novo paciente
     and Vacinas.Que eu tenha cadastrado uma nova vacina
     and Que eu registro uma nova vacinação antes do prazo
     then Registros.Valido Status code    400

##########################################################    PROFISSINAL DA SAUDE     ##################################################################################

Scenario 2: Aquele que eu registro um novo profissional da saude 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude
     then Registros.Valido Status code    201

Scenario 2: Aquele que eu registro um novo profissional da saude nome 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude sem nome 
     then Registros.Valido Status code    400

Scenario 2: Aquele que eu registro um novo profissional da saude sem CPF
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude sem CPF
     then Registros.Valido Status code    400

Scenario 2: Aquele que eu registro um novo profissional da com CPF invalidido
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude com CPF invalido 
     then Registros.Valido Status code    400

Scenario 2: Aquele que eu registro profissionais com o mesmo CPF 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude
     and Que eu registro um outro profissional com os mesmos dados
     then Registros.Valido Status code    400

############### PUT ##################

Scenario 2: Aquele que eu edito um profissional e removo seu nome 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude
     and Que eu atualizo os dados do profissionais e removo seu nome
     then Registros.Valido Status code    400

Scenario 2: Aquele que eu edito um profissional e removo seu cpf
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude
     and Que eu atualizo os dados do profissionais e removo seu CPF
     then Registros.Valido Status code    400

Scenario 2: Aquele que eu edito um profissional e informo um CPF invalido 
     [Tags]    APIGerenciamento    Regressão
     Given Que eu registro um novo profissional da saude
     and Que eu atualizo os dados do profissionais e passo um CPF invalido
     then Registros.Valido Status code    400


################ DELETE ##################

Scenario 2: Aquele que eu deleto multiplos profissionais da saude 
    Given Registros.Deletar multiplas vacinas por id    6560ea9794a33a60c43f31ec   6560e70294a33a60c43f31e9    6560e38d94a33a60c43f31e2     6560e99d94a33a60c43f31eb