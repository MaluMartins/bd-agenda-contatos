-- criar banco de dados de agenda de contatos
CREATE DATABASE agenda;
\c agenda

-- criar tabela de contatos
CREATE TABLE contatos (nome varchar(100), email varchar(100), telefone varchar(15), grupo varchar(100));
\dt

-- inserir 50 registros na tabela
INSERT INTO contatos (nome, email, telefone, grupo) VALUES ('Paulo Almeida', 'paulo.almeida@gmail.com', 23411930167, 'amigos'), ('Ana Lima', 'ana.lima@hotmail.com', 04702186398, 'faculdade'), ('João Martins', 'joão.martins@yahoo.com', 20595097998, 'trabalho'), ('Fernanda Oliveira', 'fernanda.oliveira@yahoo.com', 96669953975, 'trabalho'), ('Juliana Almeida', 'juliana.almeida@icloud.com', 94033085088, 'amigos'), ('Paulo Lima', 'paulo.lima@gmail.com', 90410043387, 'faculdade'), ('Juliana Lima', 'juliana.lima@gmail.com', 33953266180, 'trabalho'), ('Mariana Almeida', 'mariana.almeida@icloud.com', 47764097921, 'família'), ('Carlos Lima', 'carlos.lima@outlook.com', 11956170502, 'família'), ('Ana Martins', 'ana.martins@hotmail.com', 86524267439, 'faculdade'), ('Carlos Martins', 'carlos.martins@outlook.com', 41524672302, 'família'), ('Mariana Pereira', 'mariana.pereira@yahoo.com', 42549762018, 'amigos'), ('Fernanda Rodrigues', 'fernanda.rodrigues@yahoo.com', 76093326203, 'trabalho'), ('Paulo Martins', 'paulo.martins@yahoo.com', 38036927481, 'amigos'), ('Fernanda Silva', 'fernanda.silva@icloud.com', 12195332820, 'faculdade'), ('Carlos Costa', 'carlos.costa@icloud.com', 35304929527, 'família'), ('Mariana Martins', 'mariana.martins@gmail.com', 07811549650, 'trabalho'), ('Maria Pereira', 'maria.pereira@outlook.com', 92399722398, 'trabalho'), ('Carlos Pereira', 'carlos.pereira@gmail.com', 45811612355, 'família'), ('Juliana Rodrigues', 'juliana.rodrigues@yahoo.com', 53141512551, 'amigos'), ('José Almeida', 'josé.almeida@gmail.com', 15047468657, 'amigos'), ('Mariana Costa', 'mariana.costa@gmail.com', 61538354234, 'amigos'), ('Paulo Gomes', 'paulo.gomes@hotmail.com', 42371207062, 'amigos'), ('Carlos Santos', 'carlos.santos@hotmail.com', 11820463591, 'trabalho'), ('Ana Pereira', 'ana.pereira@gmail.com', 34066499720, 'amigos'), ('José Lima', 'josé.lima@outlook.com', 71217584291, 'amigos'), ('José Silva', 'josé.silva@yahoo.com', 29351105262, 'faculdade'), ('Ana Almeida', 'ana.almeida@yahoo.com', 27990574274, 'família'), ('Mariana Santos', 'mariana.santos@outlook.com', 90923732362, 'faculdade'), ('Maria Oliveira', 'maria.oliveira@icloud.com', 25279905894, 'faculdade'), ('Pedro Costa', 'pedro.costa@outlook.com', 32280862218, 'faculdade'), ('Maria Silva', 'maria.silva@icloud.com', 61862281482, 'família'), ('Pedro Gomes', 'pedro.gomes@gmail.com', 85858880708, 'família'), ('Fernanda Oliveira', 'fernanda.oliveira@outlook.com', 51955481367, 'faculdade'), ('Mariana Gomes', 'mariana.gomes@yahoo.com', 92438666735, 'família'), ('Juliana Almeida', 'juliana.almeida@hotmail.com', 45973753105, 'amigos'), ('João Santos', 'joão.santos@icloud.com', 62996737951, 'família'), ('Ana Costa', 'ana.costa@hotmail.com', 16068270278, 'família'), ('Juliana Gomes', 'juliana.gomes@gmail.com', 82296895843, 'família'), ('Ana Oliveira', 'ana.oliveira@yahoo.com', 54957995066, 'faculdade'), ('Ana Almeida', 'ana.almeida@yahoo.com', 29312736506, 'amigos'), ('Pedro Almeida', 'pedro.almeida@hotmail.com', 11946890316, 'amigos'), ('Paulo Rodrigues', 'paulo.rodrigues@outlook.com', 49646210321, 'família'), ('Maria Almeida', 'maria.almeida@gmail.com', 85812946767, 'faculdade'), ('Paulo Rodrigues', 'paulo.rodrigues@icloud.com', 05672964708, 'trabalho'), ('Mariana Silva', 'mariana.silva@outlook.com', 41264070678, 'amigos'), ('José Oliveira', 'josé.oliveira@hotmail.com', 05112372323, 'amigos'), ('José Santos', 'josé.santos@outlook.com', 80333991336, 'trabalho');

-- fazer buscas com diferentes filtros
SELECT * FROM contatos;
SELECT * FROM contatos WHERE grupo = 'faculdade';
SELECT nome, telefone FROM contatos WHERE grupo = 'família';
SELECT email, telefone, grupo FROM contatos WHERE nome = 'Malu Martins';
SELECT * FROM contatos WHERE nome LIKE '%Silva%';

-- atualizar registros
UPDATE contatos SET grupo = 'amigos' WHERE nome = 'Malu Martins';
UPDATE contatos SET email = 'jose.oliveira@gmail.com' WHERE nome = 'José Oliveira';
UPDATE contatos SET telefone = '16998765432' WHERE nome = 'Mariana Silva';
UPDATE contatos SET grupo = 'amigos' WHERE nome = 'Paulo Rodrigues';
UPDATE contatos SET grupo = 'faculdade' WHERE email = 'juliana.almeida@icloud.com';
UPDATE contatos SET grupo = 'amigos' WHERE nome = 'Pedro Costa';
UPDATE contatos SET grupo = 'familia' WHERE nome = 'Fernanda Silva';
UPDATE contatos SET grupo = 'trabalho' WHERE nome = 'Carlos Martins';
UPDATE contatos SET grupo = 'amigos' WHERE nome = 'Carlos Lima';
UPDATE contatos SET grupo = 'amigos' WHERE nome = 'Juliana Rodrigues';

-- incluir opção de favorito
ALTER TABLE contatos ADD favorito boolean;