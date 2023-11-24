# README: Instalação do Robot Framework

Este repositório apresenta instruções detalhadas sobre o funcionamento do projeto de automação de testes da equipe PARAMO. Aqui, você encontrará explicações sobre a estrutura do projeto e o processo necessário para configurar e executar os testes.

## Pré-requisitos

Certifique-se de ter o seguinte instalado antes de prosseguir:

- **Python**: O Robot Framework é baseado em Python. Certifique-se de ter o Python instalado em seu sistema. [Download do Python](https://www.python.org/downloads/)

## Instalação do Robot Framework

Siga estas etapas para instalar o Robot Framework:

### Instalação via pip:

Abra o terminal ou prompt de comando e execute o seguinte comando:

```bash
pip install robotframework
```
Em seguida execute esse comando para validar a isntalção do framework 

```bash
robot --version
```

### Test Suite:
O projeto é dividido em trës suites de testes, sendo elas :

 - **Vacinas :** Onde são realizados todos os testes de criação, edição e exclusão das vacinas
 - **Pacientes :** Onde são realizados todos os testes de criação, edição e exclusão dos pacientes
 - **Gerencial :** Onde são realizados todos os testes de criação, edição e exclusão dos profissionais de saude, e onde são registradas todas as vacinações.

### Comandos de execução 
Para executar as suites de testes podemos utilizar esses comandos:
obs: É importante que voce esteja na raiz do projeto 

 - **Vacinas :** Para executar todos os testes dessa suite
   ```bahs
    robot -d ./Reports -i Regressão .\Features\VacinasBDD.robot
   ```
 - **Pacientes :** Para executar todos os testes dessa suite
   ```bahs
    robot -d ./Reports -i Regressão .\Features\PacientesBDD.robot
   ```
 - **Gerencial :** Para executar todos os testes dessa suite
   ```bahs
    robot -d ./Reports -i Regressão .\Features\RegistrosBDD.robot         
   ```
- **Todos :** Para executar TODOS os cenarios de teste
  ```bahs
    robot -d ./Reports -i Regressão .\Features
   ```

