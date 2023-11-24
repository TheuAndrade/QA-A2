import random
from datetime import datetime, timedelta
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()

def gerando_nova_vacina():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC" + str(random.randint(1,99))
    dados = {
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
        "nome": "",
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

def gerando_nova_vacina_sem_fabricante():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante":"",
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

def gerando_nova_vacina_sem_lote():

    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": "",
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_com_lote_negativo():

    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": "-12",
        "validade": "2024-12-31T00:00:00.000+00:00",
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

def gerando_nova_vacina_sem_doses():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": "",
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_com_doses_negativas():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": -4,
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
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": ""
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_com_intervaloDeDoses_negativo():

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC"
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade": "2024-12-31T00:00:00.000+00:00",
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": -12
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data

def gerando_nova_vacina_vencimento_proximo():

    hora_atual = datetime.now()
    hora_futura = hora_atual + timedelta(hours=6)
    iso_format = "%Y-%m-%dT%H:%M:%S.%f%z"
    horario_formatado = hora_futura.strftime(iso_format)

    lote = str(random.randint(1, 100))
    intervaloEntreDoses = random.randint(3,12)
    nome = fake.cryptocurrency_code() + "VAC" + str(random.randint(1,99))
    dados = {
        "nome": nome,
        "fabricante": fake.company(),
        "lote": lote,
        "validade":horario_formatado,
        "doses": random.randint(2, 5),
        "intervaloEntreDoses": intervaloEntreDoses
    }

    json_data = json.dumps(dados, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("VacinaInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data


gerando_nova_vacina()