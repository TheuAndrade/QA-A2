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
    [Tags]    APIPacientes    Regressão    Positivo    
    Given Que eu cadastro um novo paciente
    and Valido Status code    201
    then Validando response body

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

Scenario 11: Aquele que eu tento criar um novo paciente sem idade
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

Scenario 21: Aquele que eu tento criar um novo paciente sem municipio
    [Tags]    APIPacientes    Regressão
    Given Que eu tento cadastrar um paciente sem municipio
    then Valido Status code   400

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
    And Eu edito um paciente existente e tento trocar seu cpf     
    then Valido Status code    422

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
    then Valido Status code    200

Scenario 31: Aquele que apos remover um paciente eu tento removê-lo novamente 
    [Tags]    APIPacientes    Regressão    Negativo 
    Given Que eu cadastro um novo paciente	
    and Que eu deleto um paciente 
    and Que eu tento deletar o mesmo paciente  
    then Valido Status code    404


############################# DELETE  #####################################
Scenario 32: Aquele que eu deleto um paciente pelo ID 
    [Tags]    Manual 
    Then Que eu deleto uma vacina com ID =    6559477f82f89b53c9dbe08e
    then Valido Status code    200

Scenario 33: Deletar multiplos Pacientes
    [Tags]    Manual 
    Given Deletar multiplas vacinas por id    655ffdf110ef5169fe7820a8      655ffdf110ef5169fe7820a9      655ffdf210ef5169fe7820aa      655ffdf210ef5169fe7820ab      655ffdf310ef5169fe7820ac      655ffdf310ef5169fe7820ad      655ffdf510ef5169fe7820ae      655ffdf610ef5169fe7820af      655ffdf710ef5169fe7820b0      655ffdf910ef5169fe7820b1      655ffdfa10ef5169fe7820b2      655ffdfe10ef5169fe7820b5      655ffe0010ef5169fe7820b6      6560111510ef5169fe7820b7      6560111710ef5169fe7820b8      6560111b10ef5169fe7820b9      6560111b10ef5169fe7820ba      6560111c10ef5169fe7820bb      6560111d10ef5169fe7820bc      6560111d10ef5169fe7820bd      6560111e10ef5169fe7820be      6560112010ef5169fe7820bf      6560112110ef5169fe7820c0      6560112210ef5169fe7820c1      6560112310ef5169fe7820c2      6560112410ef5169fe7820c3      6560112910ef5169fe7820c6      6560112a10ef5169fe7820c7      6560c23910ef5169fe7820c8      6560c23b10ef5169fe7820c9      6560c23f10ef5169fe7820ca      6560c24010ef5169fe7820cb      6560c24010ef5169fe7820cc      6560c24110ef5169fe7820cd      6560c24110ef5169fe7820ce      6560c24210ef5169fe7820cf      6560c24410ef5169fe7820d0      6560c24510ef5169fe7820d1      6560c24610ef5169fe7820d2      6560c24710ef5169fe7820d3      6560c24810ef5169fe7820d4      6560c24d10ef5169fe7820d7      6560c24f10ef5169fe7820d8      6560d10510ef5169fe7820d9      6560d10610ef5169fe7820da      6560f0e910ef5169fe7820db
   
    
