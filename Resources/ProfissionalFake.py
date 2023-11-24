import random
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()

def gerando_novo_profissional():
    dados = {
        "nome": fake.first_name(),
        "cpf": CPF.generate()
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("ProfissionalInfo.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_profissional_sem_nome():
    dados = {
        "nome": "",
        "cpf": CPF.generate()
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("ProfissionalInfo.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_profissional_sem_CPF():

    dados = {
        "nome": fake.first_name(),
        "cpf": ""
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("ProfissionalInfo.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_profissional_com_cpf_invalido():

    dados = {
        "nome": fake.first_name(),
        "cpf": "765937462354"
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("ProfissionalInfo.py", "w") as file:
        file.write(json_data)
    
    return json_data

gerando_novo_profissional_com_cpf_invalido()