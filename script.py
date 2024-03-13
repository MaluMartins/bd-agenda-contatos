import random
import string
import psycopg2

registros = []

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

def conectar_banco():
    try:
        connection = psycopg2.connect(
            dbname="agenda",
            user="postgres",
            password="dbadmin",
            host="localhost",
            port="5432"
        )
        print("Conexão estabelecida com sucesso!")
        return connection
    except psycopg2.Error as e:
        print("Erro ao conectar ao banco de dados:", e)
        return None

def inserir_dados(connection, dados):
    try:
        cursor = connection.cursor()

        query = f"INSERT INTO contatos (nome, email, telefone, grupo) VALUES ({dados[0]}, {dados[1]}, {dados[2]}, {dados[3]})"
        
        cursor.execute(query)

        connection.commit()
        print("Dados inseridos com sucesso!")

    except psycopg2.Error as e:
        connection.rollback()  
        print("Erro ao inserir dados:", e)

if __name__ == "__main__":
    connection = conectar_banco()

    if connection is not None:
        for _ in range(10):
            nome = gerar_nome()
            email = gerar_email(nome)
            telefone = gerar_telefone()
            grupo = gerar_grupo()
            nome = f"'{nome}'"
            email = f"'{email}'"
            telefone = f"'{telefone}'"
            grupo = f"'{grupo}'"

            dados_para_inserir = [nome, email, telefone, grupo]

            inserir_dados(connection, dados_para_inserir)

        connection.close()