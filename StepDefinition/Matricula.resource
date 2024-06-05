*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn
Library    OperatingSystem
Library    JSONLibrary

*** Variables ***
${BASE_URL}    http://localhost:8080/v1/matriculas
${API_KEY}     unime-qualidade-oficial2
${RESPONSE}
${TESTEMAXMO}        
${MATRICULADIA_JSON}        C:/Users/mathe/Desktop/Faculdaed/Robot-A3/ParamoAutomationProject/Resources/MatriculaEmDia.json
${MATRICULABOLSA100_JSON}   C:/Users/mathe/Desktop/Faculdaed/Robot-A3/ParamoAutomationProject/Resources/MatriculaDeBolsista.json
${MATRICULABOLSA50_JSON}    C:/Users/mathe/Desktop/Faculdaed/Robot-A3/ParamoAutomationProject/Resources/MatriculaDeBolsista50.json
${MATRICULPAGAMENTOFULL}    C:/Users/mathe/Desktop/Faculdaed/Robot-A3/ParamoAutomationProject/Resources/MatriculaPagamentoFull.json


*** Keywords ***

### Fazer a request e salvar o response
Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor

    [Arguments]    ${matricula}
    [Documentation]    Faz uma requisição GET para o endpoint de consulta de matrículas com a matrícula informada
    Create Session    APIMatriculas    ${BASE_URL}
    ${headers}=    Create Dictionary    X-API-KEY=${API_KEY}
    ${response}=    GET On Session    APIMatriculas    /${matricula}    headers=${headers}   expected_status=any
    Log    ${response.status_code}

    Set Suite Variable    ${RESPONSE_VALUE}    ${response.text}
    Set Suite Variable    ${RESPONSE_STATUS_CODE}    ${response.status_code}
    



### Validações de mensagem
Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula encontra-se excluída.
    [Documentation]     Validando mensagem de erro para mensalidade atrasada    
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json
    ${errorMessage}=    Get From Dictionary    ${response_json}    mensagem    default=${null}
    Should Be Equal    ${errorMessage}    A matrícula informada foi excluída de nossa base de dados!

Deve ser retornado uma resposta em JSON com uma mensagem de erro indicando que a matrícula possui pagamento em atraso.
    [Documentation]     Validando mensagem de erro para mensalidade atrasada    
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json
    ${errorMessage}=    Get From Dictionary    ${response_json}    mensagem    default=${null}
    Should Be Equal    ${errorMessage}    A matrícula informada possui débitos em aberto. Não é possível obter dados da mesma até a quitação!

Não deve ser retornada a data de vencimento da mensalidade
    [Documentation]     Validando mensagem de erro para mensalidade atrasada    
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json
    ${dueDate}=    Get From Dictionary    ${response_json}    dueDate    default=${null}
    Should Be Equal    ${dueDate}    ${null}

Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula informada é inválida.
    [Documentation]     Validando mensagem de erro para mensalidade atrasada    
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json
    ${errorMessage}=    Get From Dictionary    ${response_json}    mensagem    default=${null}
    Should Be Equal    ${errorMessage}    A matrícula informada não parece ser válida!

Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula informada é inexistente.
    [Documentation]     Validando mensagem de erro para mensalidade atrasada    
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json
    ${errorMessage}=    Get From Dictionary    ${response_json}    mensagem    default=${null}
    Should Be Equal    ${errorMessage}    A matrícula informada não foi localizada em nossa base de dados!

### Validação de Status 
Status code equal
     [Arguments]    ${status}
     [Documentation]    Validate status code
     Should Be Equal As Strings    ${RESPONSE_STATUS_CODE}    ${status}


### Comparar JSON armazenado com response (Simulando um dado salvo no banco)
Deve ser retornado uma resposta em JSON com TODOS os dados da matrícula.
    ${response_json}=    Evaluate    json.loads('''${RESPONSE_VALUE}''')    json

    # Usar ID da response para validar o Json armazenado
    ${id}=    Get From Dictionary    ${response_json}    id    default=${null}
    
    IF          ${id} == 4653421
                ${json_string} =  Get File  ${MATRICULADIA_JSON}
    
    ELSE IF     ${id} == 7890123
                ${json_string} =  Get File  ${MATRICULABOLSA100_JSON}
    
    ELSE IF     ${id} == 1113499
                ${json_string} =  Get File  ${MATRICULABOLSA50_JSON}
    
    ELSE IF     ${id} == 1122334
                ${json_string} =  Get File  ${MATRICULPAGAMENTOFULL}
    END


    
    ${json_data} =  Evaluate  json.loads('''${json_string}''')

    # Validate the fields from JSON file
    ${id}=    Get From Dictionary    ${json_data}    id    default=${null}
    Should Be Equal    ${id}    ${response_json['id']}

    ${courseName}=    Get From Dictionary    ${json_data}    courseName    default=${null}
    Should Be Equal    ${courseName}    ${response_json['courseName']}

    ${tuition}=    Get From Dictionary    ${json_data}    tuition    default=${null}
    ${amount}=    Get From Dictionary    ${tuition}    amount    default=${null}
    Should Be Equal    ${amount}    ${response_json['tuition']['amount']}

    ${formattedAmount}=    Get From Dictionary    ${tuition}    formattedAmount    default=${null}
    Should Be Equal    ${formattedAmount}    ${response_json['tuition']['formattedAmount']}

    ${dueDate}=    Get From Dictionary    ${tuition}    dueDate    default=${null}
    Should Be Equal    ${dueDate}    ${response_json['tuition']['dueDate']}

    ${status}=    Get From Dictionary    ${tuition}    status    default=${null}
    Should Be Equal    ${status}    ${response_json['tuition']['status']}

    ${student}=    Get From Dictionary    ${json_data}    student    default=${null}
    ${firstName}=    Get From Dictionary    ${student}    firstName    default=${null}    
    Should Be Equal    ${firstName}    ${response_json['student']['firstName']}

    ${lastName}=    Get From Dictionary    ${student}    lastName    default=${null}
    Should Be Equal    ${lastName}    ${response_json['student']['lastName']}

    ${birthDate}=    Get From Dictionary    ${student}    birthDate    default=${null}
    Should Be Equal    ${birthDate}    ${response_json['student']['birthDate']}

    ${cpf}=    Get From Dictionary    ${student}    cpf    default=${null}
    Should Be Equal    ${cpf}    ${response_json['student']['cpf']}


