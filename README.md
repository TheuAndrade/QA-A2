# README: Instalação do Robot Framework

Este repositório fornece instruções detalhadas sobre como instalar o Robot Framework, uma estrutura de automação de teste de código aberto fácil de usar.

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
