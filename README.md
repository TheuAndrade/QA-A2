# README: Instalação do Robot Framework

Este repositório apresenta instruções detalhadas sobre o funcionamento do projeto de automação de testes. Aqui, você encontrará explicações sobre a estrutura do projeto e o processo necessário para configurar e executar os testes.

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
O projeto possui apenas uma Test Suit:

 - **MatriculaBDD.robot :** Onde são realizados todos os testes
![image](https://github.com/TheuAndrade/QA-A2/assets/22658521/d06260a0-26e0-432c-8c2d-d236696d2773)

### Validação de JSON:
 Para ser mais fiel nas validações de testes, os JSON foram armazedos na pasta Resources, assim cada campo é validado de forma individual.
 Dessa forma qualquer inforção que esteja divergente do esperado sera notificada como erro, dessa forma tambem foi possivel usar apenas 1 step para validar todos os scenrios.

### Comandos de execução 
Para executar a suite de testes podemos utilizar esse comando:
obs: É importante que voce esteja na pasta Features 

 - **Matricula :** Para executar todos os testes dessa suite
   ```bahs
    robot --include Regressão .
   ```


### Reports:
Apos a execução dos testes, voce podera ver uma serie de inforamções relevantes sobre os seus testes, muito util para debugar um cenario que falhou. 
Para ter acesso ao reporte, abra o arquivo reports.html no seu browser. 

![Report image](https://i.stack.imgur.com/9k7JB.png)
