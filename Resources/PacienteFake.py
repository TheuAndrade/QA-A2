import random
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()
estados_brasileiros = [

    "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"
]

def gerando_novo_paciente():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado":  random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_CPF_Invalido():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": fake.ssn(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }
    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)    
   
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_CPF():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": "",
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_CEP():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
 
def gerando_novo_paciente_CEP_Invalido():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "00000-000",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_nome(): 
    dados = {
        "nome": "",
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_sobrenome():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": "",
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_idade():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": "",
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_idade_negativa():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": -12,
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
      
def gerando_novo_paciente_sem_sexo():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": "",
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sexo_invalido():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": "Texugo",
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
         
def gerando_novo_paciente_sem_contato():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": "",
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_contato_invalido_MAXIMO():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": "999999999999999999",
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_contato_invalido_MINIMO():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": "9",
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_logradouro():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro":"",
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_numero():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": "",
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_bairro():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": "",
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": random.choice(estados_brasileiros)
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("PacientInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_novo_paciente_sem_municipio():


    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": "",
        "estado": random.choice(estados_brasileiros)
    }

def gerando_novo_paciente_sem_estado():
    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": fake.city(),
        "estado": ""
    }

def gerando_novo_paciente_com_estado_invalido():

    dados = {
        "nome": fake.first_name(),
        "sobrenome": fake.last_name(),
        "cpf": CPF.generate(),
        "idade": random.randint(1, 100),
        "sexo": random.choice(["M", "F"]),
        "contato": fake.phone_number(),
        "logradouro": fake.street_address(),
        "numero": random.randint(1, 100),
        "bairro": fake.city(),
        "cep": "41299-150",
        "municipio": "XD32",
        "estado": random.choice(estados_brasileiros)
    }

gerando_novo_paciente()