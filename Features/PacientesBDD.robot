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

Scenario 6: Aquele que eu tento criar um novo paciente um CEP invalido
    [Tags]    APIPacientes    Regressão     Negativo
    Given Que eu tento cadastrar um paciente com CEP invalido 
    then Valido Status code    201

Scenario 7: Aquele que eu edito um paciente
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente
    And Eu edito um paciente existente    
    then Valido Status code    200

Scenario 8: Aquele que eu deleto um paciente  
    [Tags]    APIPacientes    Regressão
    Given Que eu cadastro um novo paciente	
    Then Que eu deleto um paciente 
    then Valido Status code    204


Scenario 9: Aquele que apos remover um paciente eu tento removê-lo novamente 
    [Tags]    APIPacientes    Regressão    Negativo 
    Given Que eu cadastro um novo paciente	
    and Que eu deleto um paciente 
    and Que eu tento deletar o mesmo paciente  
    then Valido Status code    404
Scenario 10: Aquele que eu deleto um paciente pelo ID 
    [Tags]    
    Then Que eu deleto uma vacina com ID =    653d5e3616848c211328eba0
    then Valido Status code    200