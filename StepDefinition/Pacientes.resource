*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library    Collections
Library    Process
Library    ..//Resources/PacienteFake.py
Library    SeleniumLibrary


*** Variables ***
${PACIENTE-BASEURL}    https://api-pacientes-af7078c573aa.herokuapp.com/api/pacientes
&{headers}             Content-Type=application/json
    
*** Keywords ***
Que eu chamando todos pacientes
    [Documentation]    Puxa os dados de todos os pacientes 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    GET On Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    Log    ${PACIENTE-BASEURL}
    Set Suite Variable    ${RESPONSE}
    
Que eu chamo o paciente com o nome igual a 
    [Arguments]    ${nome}    ${sobrenome}
    [Documentation]    Utiliza o nome e sobrenome para filtrar um paciente 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${nome}/${sobrenome}
    ${RESPONSE}    GET On Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${nome}/${sobrenome}
    Set Suite Variable    ${RESPONSE} 

Que eu chamo o paciente com o id igual a 
    [Arguments]    ${id}  
    [Documentation]    Utiliza o ID para filtrar um paciente  
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/obter/${id}
    ${RESPONSE}    GET On Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/obter/${id}
    Set Suite Variable    ${RESPONSE} 

Que eu cadastro um novo paciente
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}  
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    Log    PacienteData: ${response_dict}  
    ${PacienteNome} =    Set Variable    ${response_dict["nome"]}    
    ${PacienteSobrenome} =    Set Variable    ${response_dict["sobrenome"]}    
    Set Suite Variable    ${RESPONSE}
    Set Suite Variable    ${PacienteNome}
    Set Suite Variable    ${PacienteSobrenome}
    Set Global Variable    ${PacienteID}    ${response_dict["id"]}

Que eu tento cadastrar um paciente com CPF invalido 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_CPF_Invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente com CEP invalido 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_CEP_Invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Eu edito um paciente existente
    ${PacienteData}    gerando_novo_paciente
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteNome}/${PacienteSobrenome}
    ${RESPONSE}    PUT On Session    alias=APIPacientes    url=${PACIENTE-BASEURL}/${PacienteNome}/${PacienteSobrenome}  data=${PacienteData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')
    Log    PacienteData: ${response_dict}
    Set Suite Variable    ${RESPONSE}
Que eu deleto um paciente 
    [Documentation]    Remove o paciente criado utilizando o nome e sobrenome 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/excluir/${PacienteNome}/${PacienteSobrenome}
    ${RESPONSE}     DELETE On Session     alias=APIPacientes     url=${PACIENTE-BASEURL}/excluir/${PacienteNome}/${PacienteSobrenome}
    Set Suite Variable    ${RESPONSE}

Que eu tento deletar o mesmo paciente 
    [Documentation]    Remove o paciente criado utilizando o nome e sobrenome 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/excluir/${PacienteNome}/${PacienteSobrenome}
    ${RESPONSE}     DELETE On Session   expected_status=any     alias=APIPacientes     url=${PACIENTE-BASEURL}/excluir/${PacienteNome}/${PacienteSobrenome}
    Set Suite Variable    ${RESPONSE}

Que eu deleto uma vacina com ID =
    [Documentation]    Remove o paciente pelo ID 
    [Arguments]    ${ID}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/remover/${ID}
    ${RESPONSE}     DELETE On Session  expected_status=any  alias=APIPacientes     url=${PACIENTE-BASEURL}/remover/${ID}
    Set Suite Variable    ${RESPONSE}

Valido Status code
    [Documentation]    Utiliza o reponse para validar o staus 
    [Arguments]    ${expected_status}
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}   
