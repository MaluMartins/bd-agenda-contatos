import random
import string

def gerar_nome():
    nomes = ["João", "Maria", "José", "Ana", "Pedro", "Mariana", "Carlos", "Fernanda", "Paulo", "Juliana"]
    sobrenomes = ["Silva", "Santos", "Oliveira", "Pereira", "Almeida", "Rodrigues", "Costa", "Gomes", "Martins", "Lima"]
    nome = random.choice(nomes) + " " + random.choice(sobrenomes)
    return nome

def gerar_email(nome):
    dominios = ["gmail.com", "hotmail.com", "yahoo.com", "outlook.com", "icloud.com"]
    email = nome.lower().replace(" ", ".") + "@" + random.choice(dominios)
    return email

def gerar_telefone():
    telefone = ''.join(random.choices(string.digits, k=11))
    return telefone

def gerar_grupo():
    grupos = ["faculdade", "trabalho", "família", "amigos"]
    grupo = random.choice(grupos)
    return grupo

# Gerar 50 registros de nome, email e telefone
registros = []
for _ in range(38):
    nome = gerar_nome()
    email = gerar_email(nome)
    telefone = gerar_telefone()
    grupo = gerar_grupo()

    nome_com_aspas = f"'{nome}'"
    email_com_aspas = f"'{email}'"
    grupo_com_aspas = f"'{grupo}'"
    registros.append((nome_com_aspas, email_com_aspas, telefone, grupo_com_aspas))

lista_registros = ', '.join([', '.join(registro) for registro in registros])

print(lista_registros)
