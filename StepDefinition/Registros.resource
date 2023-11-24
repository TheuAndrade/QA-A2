*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library    Collections
Library    Process
Library    ..//Resources/Registro.py
Library    ..//Resources/ProfissionalFake.py
Resource  ..//StepDefinition/Pacientes.resource
Resource  ..//StepDefinition/Vacinas.resource



*** Variables ***
${GERENCIAMENTO-VACINA-BASEURL}    https://api-gerenciar-registro-vacina-f7f1a081aa54.herokuapp.com/api/vacinacao
${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    https://api-gerenciar-registro-vacina-f7f1a081aa54.herokuapp.com/api/profsaude
&{headers}             Content-Type=application/json
    
*** Keywords ***
Que eu verifico os regitros de vacinação 
    [Documentation]    Puxa os dados de todos os pacientes 
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-VACINA-BASEURL}    
    ${RESPONSE}    GET On Session  alias=APIGerencial     url=${GERENCIAMENTO-VACINA-BASEURL}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu registro uma nova vacinação
    
    ${VacinaçãoData}    gerando_novo_registro_vacinação    ${PacienteID}    ${VacinaID}    ${ProfissionalCPF}
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-VACINA-BASEURL}    
    ${RESPONSE}    POST On Session     expected_status=any    alias=APIGerencial   url=${GERENCIAMENTO-VACINA-BASEURL}    data=${VacinaçãoData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')  
    Set Suite Variable    ${RESPONSE}
    Set Global Variable    ${Informações}    ${response_dict}


Que eu registro uma nova vacinação antes do prazo     
    ${VacinaçãoData}    gerando_novo_registro_vacinação    ${PacienteID}    ${VacinaID}    ${ProfissionalCPF} 
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-VACINA-BASEURL}    
    ${RESPONSE}    POST On Session     expected_status=any    alias=APIGerencial   url=${GERENCIAMENTO-VACINA-BASEURL}    data=${VacinaçãoData}    headers=${headers}
    ${RESPONSE}    POST On Session     expected_status=any    alias=APIGerencial   url=${GERENCIAMENTO-VACINA-BASEURL}    data=${VacinaçãoData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')   
    Set Suite Variable    ${RESPONSE}
    Set Global Variable    ${Informações}    ${response_dict}


Que eu registro um novo profissional da saude 
    [Documentation]     Adicionando profissional da saude 
    ${ProfissionalData}    gerando_novo_profissional 
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}
    ${RESPONSE}    POST On Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    data=${ProfissionalData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''') 
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}
    Set Suite Variable    ${ProfissionalData}
    Set Global Variable   ${ProfissionalID}    ${response_dict["id"]}
    Set Global Variable   ${ProfissionalCPF}    ${response_dict["cpf"]}

Que eu registro um outro profissional com os mesmos dados 
    [Documentation]     Adicionando profissional da saude 
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}
    ${RESPONSE}    POST On Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu registro um novo profissional da saude sem nome
    [Documentation]     Adicionando profissional da saude 
    ${ProfissionalData}    gerando_novo_profissional_sem_nome
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}
    ${RESPONSE}    POST On Session   expected_status=any   alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu registro um novo profissional da saude sem CPF
    [Documentation]     Adicionando profissional da saude 
    ${ProfissionalData}    gerando_novo_profissional_sem_CPF
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any     alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu registro um novo profissional da saude com CPF invalido 
    [Documentation]     Adicionando profissional da saude 
    ${ProfissionalData}    gerando_novo_profissional_com_CPF_invalido
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}
    ${RESPONSE}    POST On Session  expected_status=any    alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}    data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados do profissionais e removo seu nome
    ${ProfissionalData}    gerando_novo_profissional_sem_nome 
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}
    ${RESPONSE}    PUT On Session  expected_status=any    alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}   data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados do profissionais e removo seu CPF
    ${ProfissionalData}    gerando_novo_profissional_sem_CPF
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}
    ${RESPONSE}    PUT On Session  expected_status=any    alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}   data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados do profissionais e passo um CPF invalido
    ${ProfissionalData}    gerando_novo_profissional_com_CPF_invalido
    Create Session  alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}
    ${RESPONSE}    PUT On Session  expected_status=any    alias=APIGerencial     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ProfissionalID}   data=${ProfissionalData}    headers=${headers}
    Log    ${GERENCIAMENTO-VACINA-BASEURL}    
    Set Suite Variable    ${RESPONSE}


Eu valido a mensagem recebida 
    Should Contain    ${Informações}    "A primeira dose aplicada no paciente Christopher foi:NMCVAC do laboratório Walker-Pierce. Todas as doses devem ser aplicadas com o mesmo medicamento!"    

Valido Status code
     [Arguments]    ${expected_status}
    [Documentation]    Utiliza o reponse para validar o staus 
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}  


Deletar multiplas vacinas por id
    [Arguments]    @{ids}
    FOR    ${id}    IN    @{ids}
        Que eu deleto uma vacina com ID =    ${id}
    END  

Que eu deleto uma vacina com ID =
    [Documentation]    Remove o paciente pelo ID 
    [Arguments]    ${ID}
    Create Session  alias=APIPacientes     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ID}
    ${RESPONSE}     DELETE On Session  expected_status=any  alias=APIPacientes     url=${GERENCIAMENTO-PROFISSIONAL_SAUDE-BASEURL}/${ID}
    Set Suite Variable    ${RESPONSE}