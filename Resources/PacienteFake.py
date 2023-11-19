import random
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()

def gerando_novo_paciente_CEP_Invalido():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["Masculino", "Feminino"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "00000-000",
        "municipio": fake.city(),
        "estado": fake.state_abbr()
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("Resources/PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_CPF_Invalido():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": fake.ssn(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["Masculino", "Feminino"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": fake.state_abbr()
    }
    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)    
   
    with open("Resources/PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["Masculino", "Feminino"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": fake.state_abbr()
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("Resources/PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
    
    

gerando_novo_paciente()