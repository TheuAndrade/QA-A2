from datetime import datetime, timedelta

hora_atual = datetime.now()
hora_futura = hora_atual + timedelta(hours=1)
iso_format = "%Y-%m-%dT%H:%M:%S.%f%z"
horario_formatado1 = hora_atual.strftime(iso_format)
horario_formatado2 = hora_futura.strftime(iso_format)

print(horario_formatado1+"=========="+horario_formatado2)