*** Settings ***
Library   OperatingSystem
Resource  ..//StepDefinition/Matricula.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***

Scenario 1: Deve ser possível consultar os dados de uma matrícula regular ao informar um número de matrícula válido e sem restrições.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    4653421
     And Status code equal    200
     then Deve ser retornado uma resposta em JSON com TODOS os dados da matrícula.    

Scenario 2: Deve ser retornada uma mensagem de erro ao consultar os dados de uma matrícula com pagamento em atraso.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    5566778
     And Status code equal    409
     then Deve ser retornado uma resposta em JSON com uma mensagem de erro indicando que a matrícula possui pagamento em atraso.   

Scenario 3: Deve ser possível consultar os dados de uma matrícula de aluno bolsista 100% ao informar um número de matrícula válido e sem restrições.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    7890123
     And Status code equal    200
     then Deve ser retornado uma resposta em JSON com TODOS os dados da matrícula.    

Scenario 4: Deve ser possível consultar os dados de uma matrícula de aluno bolsista 50% ao informar um número de matrícula válido e sem restrições.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    1113499
     And Status code equal    200
     then Deve ser retornado uma resposta em JSON com TODOS os dados da matrícula.

Scenario 5: Deve ser possível consultar os dados de uma matrícula de um aluno que já realizou todos os pagamentos das mensalidades futuras.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    1122334
     And Status code equal    200
     then Deve ser retornado uma resposta em JSON com TODOS os dados da matrícula.
     and Não deve ser retornada a data de vencimento da mensalidade

Scenario 6: Deve ser retornada uma mensagem de erro ao consultar os dados de uma matrícula que já foi excluída.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    4653499
     And Status code equal    404
     then Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula encontra-se excluída.

Scenario 7: Deve ser retornada uma mensagem de erro ao consultar os dados de uma matrícula inválida.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    1
     And Status code equal    400
     then Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula informada é inválida.

Scenario 8: Deve ser retornada uma mensagem de erro ao consultar os dados de uma matricula inexistente.
    [Tags]    Regressão
     Given Que realizo uma requisição do tipo GET para o endpoint de consulta de matrículas com o valor    4643421
     And Status code equal    404
     then Deve ser retornado uma resposta em JSON apenas com uma mensagem de erro indicando que a matrícula informada é inexistente.
