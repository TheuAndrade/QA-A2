import random
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()

def gerando_nova_vacina():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
   
def gerando_nova_vacina_fora_validade():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data   

def gerando_nova_vacina_sem_codigo():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": "",
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_com_():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": -132,
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_sem_nome():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": "",
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_sem_fabricante():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante":"",
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_sem_lote():

    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": "",
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_sem_validade():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_sem_intervaloDeDoses():

    lote = str(random.randint(1, 100))
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": ""
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_com_intervalDeDoses_negativo():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "codigo": random.randint(1000, 99999),
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2021-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": -12
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

gerando_nova_vacina_fora_validade() 