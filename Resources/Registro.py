import random
from faker import Faker
from cpf_generator import CPF
import json

fake = Faker()


def gerando_novo_registro_vacinação(PacienteID,IdVacina):
    dadosVacinação = {
        "idPaciente": PacienteID,
        "idVacina": IdVacina,
        "cpfProfisionalSaude": "23671044098"
    }

    json_data = json.dumps(dadosVacinação, ensure_ascii=False, indent=4)
    print(json_data)  
    
    with open("Resources/RegistroInfos.py", "w") as file:
        file.write(json_data)
    
    return json_data
    
    

