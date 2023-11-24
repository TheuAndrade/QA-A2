*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library    Collections
Library    Process
Library    SeleniumLibrary
Library    ../Resources/PacienteFake.py

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
    ${PacienteData}    gerando_novo_paciente
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    alias=APIPacientes   url=${PACIENTE-BASEURL}   data=${PacienteData}    headers=${headers}  
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    ${PacienteNome} =    Set Variable    ${response_dict["nome"]}    
    ${PacienteSobrenome} =    Set Variable    ${response_dict["sobrenome"]}    
    Set Suite Variable    ${RESPONSE}
    Set Suite Variable    ${PacienteNome}
    Set Suite Variable    ${PacienteSobrenome}
    Set Suite Variable    ${PacienteData}
    Set Suite Variable    ${ResonseValidation}    ${response_dict}
    Set Global Variable   ${PacienteID}    ${response_dict["id"]}
Que eu cadastro o mesmo paciente
    [Documentation]    Tento criar um paciente com os mesmos dados 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}
    Set Suite Variable    ${RESPONSE} 
Que eu tento cadastrar um paciente com CPF invalido 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_CPF_Invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente sem CPF 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_CPF
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente com CEP invalido 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_CEP_Invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem CEP 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_CEP
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente sem nome 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_nome
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente sem sobrenome 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_sobrenome
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem idade
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_idade
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastr    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}   
Que eu tento cadastrar um paciente com idade negativa    
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_idade_negativa
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente sem sexo
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_sexo
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}/cadastrar    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente com sexo invalido 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sexo_invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem contato 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_contato
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente com o contato exedendo as caracteres 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_contato_invalido_MAXIMO
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}   data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente com o contato com poucas caracteres 
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_contato_invalido_MINIMO
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}   data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem logradouro
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_logradouro
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem numero
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_numero
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem bairro
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_bairro
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem municipio
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_municipio
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}   data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar um paciente sem estado
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_sem_estado
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar um paciente com estado invalido
    [Documentation]    Adicionando um novo paciente 
    ${PacienteData}   gerando_novo_paciente_com_estado_invalido
    Log    PacienteData: ${PacienteData}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIPacientes   url=${PACIENTE-BASEURL}    data=${PacienteData}    headers=${headers}   
    Set Suite Variable    ${RESPONSE}
Eu edito um paciente existente e tento trocar seu CPF
    ${PacienteData}    gerando_novo_paciente
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}    PUT On Session    expected_status=any    alias=APIPacientes    url=${PACIENTE-BASEURL}/${PacienteID}  data=${PacienteData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')
    Log    PacienteData: ${response_dict}
    Set Suite Variable    ${RESPONSE}
Eu edito um paciente existente e removo seu cpf 
    ${PacienteData}    gerando_novo_paciente_sem_CPF
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}    PUT On Session    expected_status=any    alias=APIPacientes    url=${PACIENTE-BASEURL}/${PacienteID}  data=${PacienteData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Eu edito um paciente existente e informo um CPF invalido
    ${PacienteData}    gerando_novo_paciente_CPF_invalido
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}    PUT On Session    expected_status=any    alias=APIPacientes    url=${PACIENTE-BASEURL}/${PacienteID}  data=${PacienteData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Eu edito um paciente existente com idade invalida 
    ${PacienteData}    gerando_novo_paciente_idade_negativa
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}    PUT On Session    expected_status=any    alias=APIPacientes    url=${PACIENTE-BASEURL}/${PacienteID}  data=${PacienteData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu deleto um paciente 
    [Documentation]    Remove o paciente criado utilizando o nome e sobrenome 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}     DELETE On Session     alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    Set Suite Variable    ${RESPONSE}

Que eu tento deletar o mesmo paciente 
    [Documentation]    Remove o paciente criado utilizando o nome e sobrenome 
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    ${RESPONSE}     DELETE On Session   expected_status=any     alias=APIPacientes     url=${PACIENTE-BASEURL}/${PacienteID}
    Set Suite Variable    ${RESPONSE}

Deletar multiplas vacinas por id
    [Arguments]    @{ids}
    FOR    ${id}    IN    @{ids}
        Que eu deleto uma vacina com ID =    ${id}
    END  

Que eu deleto uma vacina com ID =
    [Documentation]    Remove o paciente pelo ID 
    [Arguments]    ${ID}
    Create Session  alias=APIPacientes     url=${PACIENTE-BASEURL}/${ID}
    ${RESPONSE}     DELETE On Session  expected_status=any  alias=APIPacientes     url=${PACIENTE-BASEURL}/${ID}
    Set Suite Variable    ${RESPONSE}

Valido Status code
    [Documentation]    Utiliza o reponse para validar o staus 
    [Arguments]    ${expected_status}
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}   

Validando response body
    [Documentation]    Validando formato do reponse 
    Dictionary Should Contain Key    ${ResonseValidation}    id  