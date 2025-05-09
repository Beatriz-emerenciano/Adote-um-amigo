from faker import Faker
import random

faker = Faker('pt_BR')

NUM_ABRIGOS = 5
NUM_VOLUNTARIOS = 20
NUM_VETERINARIOS = 10
NUM_DOADORES = 50
NUM_ADOTANTES = 50
NUM_ANIMAIS = 100

def main():
    with open("dados_ficticios.sql", "w", encoding="utf-8") as file:
        def write(sql): file.write(sql + "\n")

        write("-- Inserções em ABRIGO")
        for i in range(1, NUM_ABRIGOS + 1):
            nome = faker.company().replace("'", "''")
            capacidade = random.randint(10, 100)
            endereco = faker.address().replace("\n", ", ").replace("'", "''")
            write(f"INSERT INTO abrigo (id_abrigo, nome, capacidade, endereco) VALUES ({i}, '{nome}', {capacidade}, '{endereco}');")

        write("\n-- Inserções em VOLUNTARIO")
        for i in range(1, NUM_VOLUNTARIOS + 1):
            nome = faker.name().replace("'", "''")
            email = faker.email()
            telefone = faker.phone_number().replace("'", "")
            write(f"INSERT INTO voluntario (id_voluntario, nome, email, telefone) VALUES ({i}, '{nome}', '{email}', '{telefone}');")

        write("\n-- Inserções em VETERINARIO")
        for i in range(1, NUM_VETERINARIOS + 1):
            nome = faker.name().replace("'", "''")
            telefone = faker.phone_number().replace("'", "")
            especialidade = random.choice(['Cardiologia', 'Dermatologia', 'Cirurgia', 'Oftalmologia', 'Emergência'])
            write(f"INSERT INTO veterinario (id_veterinario, nome, telefone, especialidade) VALUES ({i}, '{nome}', '{telefone}', '{especialidade}');")

        write("\n-- Inserções em DOADOR")
        for i in range(1, NUM_DOADORES + 1):
            nome = faker.name().replace("'", "''")
            email = faker.email()
            telefone = faker.phone_number().replace("'", "")
            write(f"INSERT INTO doador (id_doador, nome, email, telefone) VALUES ({i}, '{nome}', '{email}', '{telefone}');")

        write("\n-- Inserções em ADOTANTE")
        for i in range(1, NUM_ADOTANTES + 1):
            nome = faker.name().replace("'", "''")
            email = faker.email()
            telefone = faker.phone_number().replace("'", "")
            write(f"INSERT INTO adotante (id_adotante, nome, email, telefone) VALUES ({i}, '{nome}', '{email}', '{telefone}');")

        write("\n-- Inserções em ANIMAL")
        for i in range(1, NUM_ANIMAIS + 1):
            nome = faker.first_name().replace("'", "''")
            data_nasc = faker.date_between(start_date='-5y', end_date='today')
            peso = round(random.uniform(1.0, 40.0), 2)
            especie = random.choice(['Cachorro', 'Gato', 'Coelho', 'Pássaro', 'Hamster'])
            abrigo_id = random.randint(1, NUM_ABRIGOS)
            write(f"INSERT INTO animal (id_animal, nome, data_nascimento, peso, especie, id_abrigo) VALUES ({i}, '{nome}', '{data_nasc}', {peso}, '{especie}', {abrigo_id});")

        write("\n-- Inserções em TRABALHA_EM")
        relacoes_te = set()
        for vid in range(1, NUM_VOLUNTARIOS + 1):
            locais = random.sample(range(1, NUM_ABRIGOS + 1), k=random.randint(1, 2))
            for aid in locais:
                if (vid, aid) not in relacoes_te:
                    write(f"INSERT INTO trabalha_em (id_voluntario, id_abrigo) VALUES ({vid}, {aid});")
                    relacoes_te.add((vid, aid))

        write("\n-- Inserções em CUIDA")
        relacoes_cuida = set()
        for vid in range(1, NUM_VETERINARIOS + 1):
            animais = random.sample(range(1, NUM_ANIMAIS + 1), k=random.randint(5, 10))
            for aid in animais:
                if (vid, aid) not in relacoes_cuida:
                    write(f"INSERT INTO cuida (id_veterinario, id_animal) VALUES ({vid}, {aid});")
                    relacoes_cuida.add((vid, aid))

        write("\n-- Inserções em DOACAO")
        relacoes_doacao = set()
        for i in range(1, NUM_ANIMAIS + 1):
            doador_id = random.randint(1, NUM_DOADORES)
            data_doacao = faker.date_between(start_date='-2y', end_date='today')
            cond = random.choice(['Boa', 'Regular', 'Ruim'])
            if (doador_id, i) not in relacoes_doacao:
                write(f"INSERT INTO doacao (id_doador, id_animal, data_doacao, condicao_animal) VALUES ({doador_id}, {i}, '{data_doacao}', '{cond}');")
                relacoes_doacao.add((doador_id, i))

        write("\n-- Inserções em ADOCAO")
        adotados = random.sample(range(1, NUM_ANIMAIS + 1), k=NUM_ANIMAIS // 2)
        for aid in adotados:
            adotante_id = random.randint(1, NUM_ADOTANTES)
            data_adocao = faker.date_between(start_date='-1y', end_date='today')
            write(f"INSERT INTO adocao (id_animal, id_adotante, data_adocao) VALUES ({aid}, {adotante_id}, '{data_adocao}');")

if __name__ == "__main__":
    main()
