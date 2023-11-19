*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library    Collections
Library    Process
Library    ..//Resources/Registro.py
Resource  ..//StepDefinition/Pacientes.resource
Resource  ..//StepDefinition/Vacinas.resource



*** Variables ***
${GERENCIAMENTO-BASEURL}    https://api-gerenciar-registro-vacina-f7f1a081aa54.herokuapp.com/api/vacinacao
&{headers}             Content-Type=application/json
    
*** Keywords ***
Que eu verifico os regitros de vacinação 
    [Documentation]    Puxa os dados de todos os pacientes 
    Create Session  alias=APIPacientes     url=${GERENCIAMENTO-BASEURL}    
    ${RESPONSE}    GET On Session  alias=APIPacientes     url=${GERENCIAMENTO-BASEURL}    
    Log    ${GERENCIAMENTO-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu registro uma nova vacinação
    
    ${VacinaçãoData}    gerando_novo_registro_vacinação    ${PacienteID}    ${VacinaID} 
    Create Session  alias=APIPacientes     url=${GERENCIAMENTO-BASEURL}    
    ${RESPONSE}    POST On Session    alias=APIPacientes   url=${GERENCIAMENTO-BASEURL}/cadastrar    data=${VacinaçãoData}    headers=${headers}  
    Log    ${GERENCIAMENTO-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Valido Status code
     [Arguments]    ${expected_status}
    [Documentation]    Utiliza o reponse para validar o staus 
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}   