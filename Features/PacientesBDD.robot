*** Settings ***
Library  SeleniumLibrary
Library   OperatingSystem
Resource  ..//StepDefinition/Pacientes.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***

Scenario 1: Aquele que eu busco por todos os pacientes 
    [Tags]    APIPacientes    Regressão
     Given Que eu chamando todos pacientes
     then Valido Status code    200

Scenario 2: Aquele que eu busco por um paciente pelo nome
    [Tags]    APIPacientes   
     Given Que eu chamo o paciente com o nome igual a    Charles    Carroll             
     then Valido Status code    200

Scenario 3: Aquele que eu busco por um paciente pelo ID
    [Tags]        
     Given Que eu chamo o paciente com o id igual a    653c73cde542ce50230e7ca6                        
     then Valido Status code    200

Scenario 4: Aquele que eu crio um novo paciente
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    then Valido Status code    201

Scenario 5: Aquele que eu tento criar um novo paciente um CPF invalido
    [Tags]    APIPacientes    Regressão    Negativo
    Given Que eu tento cadastrar um paciente com CPF invalido
    then Valido Status code   422

Scenario 6: Aquele que eu tento criar um novo paciente sem CPF
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem CPF 
    then Valido Status code   422

Scenario 7: Aquele que eu tento criar um novo paciente um CEP invalido
    [Tags]    APIPacientes    Regressão     Negativo
    Given Que eu tento cadastrar um paciente com CEP invalido 
    then Valido Status code    422

Scenario 8: Aquele que eu tento criar um novo paciente sem CEP
    [Tags]    APIPacientes    Regressão 
    Given Que eu tento cadastrar um paciente sem CEP 
    then Valido Status code   422

Scenario 9: Aquele que eu tento criar um novo paciente sem nome
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem nome
    then Valido Status code   422

Scenario 10: Aquele que eu tento criar um novo paciente sem sobrenome
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem sobrenome
    then Valido Status code   422

Scenario 11: Aquele que eu tento criar um novo paciente sem 
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem idade
    then Valido Status code   422

Scenario 12: Aquele que eu tento criar um novo paciente com idade negativa
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente com idade negativa
    then Valido Status code   422

Scenario 13: Aquele que eu tento criar um novo paciente sem sexo
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem sexo
    then Valido Status code   422

Scenario 14: Aquele que eu tento criar um novo paciente com sexo invalido
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente com sexo invalido
    then Valido Status code   422

Scenario 15: Aquele que eu tento criar um novo paciente sem contato
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem contato
    then Valido Status code   422

Scenario 16: Aquele que eu tento criar um novo paciente com contato exedendo as caracteres
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente com o contato exedendo as caracteres
    then Valido Status code   422

Scenario 17: Aquele que eu tento criar um novo paciente com poucas caracteres
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente com o contato com poucas caracteres
    then Valido Status code   422

Scenario 18: Aquele que eu tento criar um novo paciente sem logradouro
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem logradouro
    then Valido Status code   422

Scenario 19: Aquele que eu tento criar um novo paciente sem numero
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem numero
    then Valido Status code   422

Scenario 20: Aquele que eu tento criar um novo paciente sem bairro
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem bairro
    then Valido Status code   422

Scenario 21: Aquele que eu tento criar um novo paciente em municipio
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem municipio
    then Valido Status code   422

Scenario 22: Aquele que eu tento criar um novo paciente sem estado
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem estado
    then Valido Status code   422

Scenario 23: Aquele que eu tento criar um novo paciente com estado invalido
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente com estado invalido
    then Valido Status code   422
Scenario 24: Aquele que eu tento criar dois pacientes iguais
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Valido Status code    201
    When Que eu cadastro o mesmo paciente
    then Valido Status code   422
Scenario 25: Aquele que eu edito todos os dados de um paciente
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Eu edito um paciente existente    
    then Valido Status code    200

Scenario 26: Aquele que eu edito um paciente e removo seu cpf 
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Eu edito um paciente existente e removo seu cpf    
    then Valido Status code    422

Scenario 27: Aquele que eu edito um paciente e adiciona um CPF invalido 
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Eu edito um paciente existente e informo um CPF invalido
    then Valido Status code    422

Scenario 29: Aquele que eu edito um paciente com uma idade invalida 
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Eu edito um paciente existente com idade invalida
    then Valido Status code    422

Scenario 30: Aquele que eu deleto um paciente  
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente	
    Then Que eu deleto um paciente 
    then Valido Status code    204

Scenario 31: Aquele que apos remover um paciente eu tento removê-lo novamente 
    [Tags]    APIPacientes    Regressão    Negativo 
    Given Que eu cadastro um novo paciente	
    and Que eu deleto um paciente 
    and Que eu tento deletar o mesmo paciente  
    then Valido Status code    404
Scenario 32: Aquele que eu deleto um paciente pelo ID 
    [Tags]    Manual 
    Then Que eu deleto uma vacina com ID =    6559477f82f89b53c9dbe08e
    then Valido Status code    200

Scenario 33: Deletar multiplos Pacientes
    [Tags]    Manual 
    Given Deletar multiplas vacinas por id    655957c482f89b53c9dbe092	655957f482f89b53c9dbe093	6559581e82f89b53c9dbe094	6559583c82f89b53c9dbe095	6559587d82f89b53c9dbe096	655958e182f89b53c9dbe097	65595b1b82f89b53c9dbe098	65595bce82f89b53c9dbe099	65595c4482f89b53c9dbe09a	65595c7482f89b53c9dbe09b	65595c9c82f89b53c9dbe09c	65595cc082f89b53c9dbe09d	65595cd782f89b53c9dbe09e	65595d2882f89b53c9dbe09f	65595df382f89b53c9dbe0a0	65595e2882f89b53c9dbe0a1	65595e6782f89b53c9dbe0a2	65595e7d82f89b53c9dbe0a3	65595e8b82f89b53c9dbe0a4	65595e8c82f89b53c9dbe0a5	65595e8c82f89b53c9dbe0a6	65595e9182f89b53c9dbe0a9	6559635782f89b53c9dbe0aa	6559635882f89b53c9dbe0ab	6559635982f89b53c9dbe0ac	6559636282f89b53c9dbe0af	655963ad82f89b53c9dbe0b0	655963ae82f89b53c9dbe0b1	655963af82f89b53c9dbe0b2	655963b382f89b53c9dbe0b5	655966c382f89b53c9dbe0b6	655966c582f89b53c9dbe0b7	655967d782f89b53c9dbe0b8	655967d882f89b53c9dbe0b9	655967d982f89b53c9dbe0ba	655967dd82f89b53c9dbe0bd	655968eef6f0a24498d4d1b9	6559691ef6f0a24498d4d1ba	6559695bf6f0a24498d4d1bb	65596987f6f0a24498d4d1bc	655969b3f6f0a24498d4d1bd	655969c7f6f0a24498d4d1be	655969dcf6f0a24498d4d1bf	65596a08f6f0a24498d4d1c0	65596a4ff6f0a24498d4d1c1	65596c4957bd2c55b7a0bd3a	65596c7d57bd2c55b7a0bd3b	65596cb757bd2c55b7a0bd3c	65596ccb57bd2c55b7a0bd3d	65596cda57bd2c55b7a0bd3e	65596d3e57bd2c55b7a0bd3f	65596d9457bd2c55b7a0bd40	65596da157bd2c55b7a0bd41	65596df757bd2c55b7a0bd42	65596df857bd2c55b7a0bd43	65596df957bd2c55b7a0bd44	65596dfd57bd2c55b7a0bd47	65596dff57bd2c55b7a0bd48	655adb0a158dbf671819953f       
 