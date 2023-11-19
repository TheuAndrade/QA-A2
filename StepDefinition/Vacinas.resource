*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    json
Library     Collections
Library    ..//Resources/VacinaFake.py



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
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    alias=APIVacinas    url=${VACINAS-BASEURL}/cadastrar    data=${VacinaData}    headers=${headers}
    ${response_dict} =    Evaluate    json.loads('''${RESPONSE.text}''')   
    Set Global Variable   ${VacinaID}    ${response_dict['Gravado com sucesso!']['id']}     
    Log    O valor do ID é: ${VacinaID}
    Set Suite Variable    ${RESPONSE}
   

Que eu tento cadastrar uma nova vacina fora da validade
    [Documentation]    Adicionando uma nova vacina
    ${VacinaData}    gerando_nova_vacina_fora_validade
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/cadastrar
    ${RESPONSE}    POST On Session    expected_status=any    alias=APIVacinas    url=${VACINAS-BASEURL}/cadastrar    data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}

Que eu atualizo os dados da vacina
     ${VacinaData}    gerando_nova_vacina
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/editar/${VacinaID}
     ${RESPONSE}    PUT On Session    alias=APIVacinas    url=${VACINAS-BASEURL}/editar/${VacinaID}   data=${VacinaData}    headers=${headers}
    Set Suite Variable    ${RESPONSE}
Que eu deleto a vacina criada
    [Documentation]    Remove uma vacina apartir do ID
    Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/remover/${VacinaID}
    ${RESPONSE}     DELETE On Session  alias=APIVacinas     url=${VACINAS-BASEURL}/remover/${VacinaID}
    Set Suite Variable    ${RESPONSE}

Que eu deleto uma vacina com ID =    
       [Arguments]    ${ID}
       Create Session  alias=APIVacinas     url=${VACINAS-BASEURL}/remover/${ID}
       ${RESPONSE}     DELETE On Session  alias=APIVacinas     url=${VACINAS-BASEURL}/remover/${ID}
       Set Suite Variable    ${RESPONSE}

Valido Status code
     [Arguments]    ${expected_status}
    [Documentation]    Utiliza o reponse para validar o staus 
    ${RESPONSE} =    Get Variable Value    ${RESPONSE}
    Should Be Equal As Strings    ${RESPONSE.status_code}    ${expected_status}   