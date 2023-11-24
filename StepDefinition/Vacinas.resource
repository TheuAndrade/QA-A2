*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library     Collections
Library    ../Resources/VacinaFake.py



*** Variables ***
${VACINAS-BASEURL}    https://api-vacinas-bsi-f03cac251e91.herokuapp.com/api/vacinas
#${RESPONSE}
${RESPONSE-ID}
&{headers}      Content-Type=application/json
*** Keywords ***
Chamando todas as vacinas
    [Documentation]    Realiza a request e armazedo o VacinaID do respose 
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    GET On Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    Set Suite Variable    ${RESPONSE}
    
Que eu tenha cadastrado uma nova vacina
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')   
    Set Global Variable   ${VacinaID}    ${response_dict['id']}     
    Log    O valor do ID é: ${VacinaID}
    Set Suite Variable    ${RESPONSE}
    Set Suite Variable    ${MesmaVacina}    ${VacinaData}
    Set Suite Variable    ${ResponseValidation}    ${response_dict}

Que eu tento cadastrar uma nova vacina fora da validade
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_fora_validade
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

# Que eu tento cadastrar uma nova vacina sem codigo
#     [Documentation]    Adicionando uma nova vacina
#     ${VacinaData}    gerando_nova_vacina_sem_codigo
#     Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
#     ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/cadastrar    data=${VacinaData}    headers=${headers}
#     Set Suite Variable    ${RESPONSE}

# Que eu tento cadastrar uma nova vacina com codigo negativo
#     [Documentation]    Adicionando uma nova vacina
#     ${VacinaData}    gerando_nova_vacina_com_codigo_negativo 
#     Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
#     ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/cadastrar    data=${VacinaData}    headers=${headers}
#     Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina proxima do vencimento
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}     gerando_nova_vacina_vencimento_proximo
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina sem nome 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_nome
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina sem fabricante 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_fabricante
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina sem lote
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_lote
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina com lote negativo 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_com_lote_negativo
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina sem validade
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_validade
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina sem doses 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_doses
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina com doses negativas 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_com_doses_negativas
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}
Que eu tento cadastrar uma nova vacina sem intervalo entre doses 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_sem_intervaloDeDoses
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu tento cadastrar uma nova vacina com intervalo de doses negativo 
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_com_intervaloDeDoses_negativo
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Eu tento cadastrar a mesma vacina
    [Documentation]    Adicionando a mesma vacina duas vezes
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}
    ${RESPONSE}    POST On Session    expected_status=any     alias=APIVacinas    url=${VACINAS-BASEURL} 

Que eu atualizo os dados da vacina e removo o nome 
     ${VacinaData}    gerando_nova_vacina_sem_nome
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e removo o fabricante 
     ${VacinaData}    gerando_nova_vacina_sem_fabricante 
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e removo o lote 
     ${VacinaData}    gerando_nova_vacina_sem_lote 
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e passo um lote negativo 
     ${VacinaData}    gerando_nova_vacina_com_lote_negativo 
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e removo a validade 
     ${VacinaData}    gerando_nova_vacina_sem_validade 
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e inforo uma valdiade vencida 
     ${VacinaData}    gerando_nova_vacina_fora_validade
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e removo a quantidade de doses 
     ${VacinaData}    gerando_nova_vacina_sem_doses
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e passo uma dose negativa 
     ${VacinaData}    gerando_nova_vacina_com_doses_negativas
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session   expected_status=any     expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e removo o intervalo entre dose
     ${VacinaData}    gerando_nova_vacina_sem_intervaloDeDoses
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina e passo um intervalo entre doses negativo 
     ${VacinaData}    gerando_nova_vacina_com_intervaloDeDoses_negativo
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina
     ${VacinaData}    gerando_nova_vacina
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
     ${RESPONSE}    PUT On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu deleto a vacina criada
    [Documentation]    Remove uma vacina apartir do ID
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}
    ${RESPONSE}     DELETE On Session  expected_status=any     alias=APIVacinas     url=${VACINAS-BASEURL}/${VacinaID}     data=${MesmaVacina}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Valido Status code
     [Arguments]    ${expected_status}
    [Documentation]    Utiliza o reponse para validar o staus 
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}   

Que eu deleto multipas vacinas
    [Arguments]    @{ids}
    FOR    ${id}    IN    @{ids}
        Que eu deleto uma vacina com ID =  ${id}
    END

Que eu deleto uma vacina com ID =    
       [Arguments]    ${ID}
       Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${ID}
       ${RESPONSE}     DELETE On Session  alias=APIVacinas     url=${VACINAS-BASEURL}/${ID}
       Set Suite Variable    ${RESPONSE}
