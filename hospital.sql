DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE historico_medico (
    id_historico INT PRIMARY KEY,
    id_enfermeiro INT,
    id_paciente INT,
    id_medico INT,
    datahistorico DATE,
    descricao TEXT
);

CREATE TABLE enfermeiro (
    id_enfermeiro INT PRIMARY KEY,
    id_historico INT,
    area_atuacao TEXT,
    nascimento DATE,
    endereco TEXT,
    telefone TEXT,
    email TEXT,
    cre TEXT,
    nome TEXT
);

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY,
    id_historico INT,
    nome TEXT,
    nascimento DATE,
    endereco TEXT,
    telefone TEXT,
    cpf TEXT
);

CREATE TABLE triagem (
    id_triagem INT PRIMARY KEY,
    id_paciente INT,
    id_enfermeiro INT,
    data_triagem DATE,
    hora_triagem TIME,
    sintomas TEXT,
    sinais_vitais TEXT,
    prioridade INT
);

CREATE TABLE medico (
    id_medico INT PRIMARY KEY,
    id_historico INT,
    especialidade TEXT,
    nascimento DATE,
    endereco TEXT,
    telefone TEXT,
    email TEXT,
    cre TEXT,
    nome TEXT
);

CREATE TABLE sala (
    id_sala INT PRIMARY KEY,
    numero_sala VARCHAR(50),
    andar INT,
    tipo_sala VARCHAR(100)
);

CREATE TABLE equipamentos_medicos (
    id_equipamentos INT PRIMARY KEY,
    id_sala INT,
    nome_equipamento VARCHAR(100),
    status_equipamento VARCHAR(50),
    data_aquisicao DATE,
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala)
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    id_enfermeiro INT,
    id_receita INT,
    id_sala INT,
    data_consulta DATE,
    hora TIME
);

CREATE TABLE receita_medica (
    id_receita INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    id_consulta INT,
    id_medicamento INT,
    dosagem TEXT,
    frequencia TEXT,
    duracao TEXT,
    instrucoes TEXT
);

CREATE TABLE medicamentos (
    id_medicamentos INT PRIMARY KEY,
    nome_medicamento TEXT,
    efeitos_colaterais TEXT,
    quantidade INT
);

CREATE TABLE entrada_saida (
    id_entrada_saida INT PRIMARY KEY,
    id_medicamentos INT,
    id_fornecedor INT,
    tipo_movimentacao TEXT,
    data_movimentacao DATE,
    observacoes TEXT
);

CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY,
    telefone TEXT,
    email TEXT,
    turma TEXT,
    nome TEXT,
    cargo TEXT,
    cpf TEXT
);

CREATE TABLE movimentacao_estoque (
    id_movimentacao INT PRIMARY KEY,
    id_estoque INT,
    id_responsavel INT,
    quantidade INT,
    data_movimentacao DATE,
    tipo_movimentacao TEXT
);

CREATE TABLE estoque_medicamentos (
    id_estoque INT PRIMARY KEY,
    id_medicamentos INT,
    id_fornecedor INT,
    localizacao TEXT,
    quantidade INT,
    data_validade DATE,
    data_fabricacao DATE,
    status_medicamentos TEXT
);

CREATE TABLE pedido_medicamentos (
    id_pedido INT PRIMARY KEY,
    id_medicamentos INT,
    id_fornecedor INT,
    data_pedido DATE,
    data_entrega DATE,
    status_pedido TEXT,
    nota_fiscal TEXT
);

CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome TEXT,
    cnpj TEXT,
    endereco TEXT,
    telefone TEXT
);

CREATE TABLE visitantes (
    id_visitantes INT PRIMARY KEY,
    nome TEXT,
    sexo TEXT,
    endereco TEXT,
    telefone TEXT,
    cpf TEXT
);

CREATE TABLE visitas (
    id_visitas INT PRIMARY KEY,
    id_visitantes INT,
    id_internacao INT,
    data_visita DATE,
    hora TIME,
    observacoes TEXT
);

CREATE TABLE internacao (
    id_internacao INT PRIMARY KEY,
    id_consulta INT,
    id_sala INT,
    id_medico INT,
    id_enfermeiro INT,
    data_internacao DATE,
    data_alta DATE,
    motivo_internacao TEXT,
    observacoes TEXT
);

CREATE TABLE cirurgia (
    id_cirurgia INT PRIMARY KEY,
    id_consulta INT,
    id_paciente INT,
    id_medico INT,
    id_enfermeiro INT,
    data_cirurgia DATE,
    tipo_cirurgia TEXT,
    duracao TIME,
    sala_cirurgia TEXT,
    observacoes TEXT
);

CREATE TABLE raiox (
    id_raiox INT PRIMARY KEY,
    id_consulta INT,
    id_medico INT,
    id_enfermeiro INT,
    id_paciente INT,
    data_raiox DATE,
    tipo TEXT,
    resultado TEXT
);

CREATE TABLE acompanhamento_raiox (
    id_acompanhamentoraiox INT PRIMARY KEY,
    id_raiox INT,
    id_medico INT,
    id_paciente INT,
    recomendacoes_tratamento TEXT,
    data_acompanhamento DATE,
    observacoes TEXT,
    proxima_consulta DATE
);

CREATE TABLE vacinacao (
    id_vacinacao INT PRIMARY KEY,
    id_vacina INT,
    local_vacinacao TEXT,
    data_vacinacao DATE,
    id_paciente INT,
    id_enfermeiro INT,
    observacoes TEXT,
    dose TEXT
);

CREATE TABLE acompanhamento_vacinacao (
    id_acompanhamentovacinacao INT PRIMARY KEY,
    id_vacinacao INT,
    id_medico INT,
    id_paciente INT,
    recomendacoes_adicionais TEXT,
    data_acompanhamento DATE,
    observacoes TEXT,
    proxima_dose DATE,
    efeitos_adversos TEXT
);

CREATE TABLE exame (
    id_exame INT PRIMARY KEY,
    id_consulta INT,
    id_paciente INT,
    id_medico INT,
    id_enfermeiro INT,
    tipo_exame VARCHAR(100),
    data_exame DATE,
    resultado TEXT
);

CREATE TABLE acompanhamento_exame (
    id_acompanhamentoexame INT PRIMARY KEY,
    id_exame INT,
    id_medico INT,
    id_paciente INT,
    recomendacoes_tratamento TEXT,
    data_acompanhamento DATE,
    observacoes TEXT,
    proxima_consulta DATE
);

CREATE TABLE tratamento (
    id_tratamento INT PRIMARY KEY,
    id_consulta INT,
    id_paciente INT,
    id_medico INT,
    id_enfermeiro INT,
    data_inicio DATE,
    data_fim DATE,
    descricao TEXT,
    tipo_tratamento VARCHAR(100)
);

CREATE TABLE acompanhamento_tratamento (
    id_acompanhamentotratamento INT PRIMARY KEY,
    id_tratamento INT,
    id_medico INT,
    id_paciente INT,
    recomendacoes_tratamento TEXT,
    data_acompanhamento DATE,
    observacoes TEXT,
    proxima_consulta DATE
);

INSERT INTO enfermeiro (id_enfermeiro, id_historico, area_atuacao, nascimento, endereco, telefone, email, cre, nome)
VALUES
(1, 1, 'Hospital', '1980-01-15', 'Rua Alberto, 456', '987654321', 'enfermeiro1@hospital.com', 'CRE123', 'Maria Souza'),
(2, 2, 'Emergência', '1990-02-25', 'Rua Bruno Formiga, 789', '876543210', 'enfermeiro2@hospital.com', 'CRE456', 'Carlos Lima'),
(3, 3, 'Centro Cirúrgico', '1982-03-10', 'Rua das Palmeiras, 345', '11987654321', 'ana3@hospital.com', 'CRE789', 'Ana Oliveira'),
(4, 4, 'Centro Cirúrgico', '1985-07-22', 'Avenida Brasil, 864', '11976543210', 'bruno4@hospital.com', 'CRE101', 'Bruno Santos'),
(5, 5, 'Obstetrícia', '1991-11-05', 'Rua dos Pinheiros, 23', '11965432109', 'carla5@hospital.com', 'CRE202', 'Carla Ferreira'),
(6, 6, 'Resgate', '1988-04-12', 'Avenida Paulista, 674', '11954321098', 'diego6@hospital.com', 'CRE303', 'Diego Costa'),
(7, 7, 'Emergência', '1983-09-23', 'Rua das Flores, 52', '11943210987', 'elisa7@hospital.com', 'CRE404', 'Elisa Lima'),
(8, 8, 'Hospital', '1990-02-17', 'Avenida Ipiranga, 266', '11932109876', 'fernando8@hospital.com', 'CRE505', 'Fernando Almeida'),
(9, 9, 'Hospital', '1987-06-30', 'Rua Augusta, 356', '11921098765', 'gabriela9@hospital.com', 'CRE606', 'Gabriela Souza'),
(10, 10, 'Centro Cirúrgico', '1984-08-25', 'Rua da Consolação, 634', '11910987654', 'henrique10@hospital.com', 'CRE707', 'Henrique Ribeiro');

INSERT INTO paciente (id_paciente, id_historico, nome, nascimento, endereco, telefone, cpf)
VALUES
(1, 1, 'Ana Pereira', '1992-08-30', 'Avenida Central, 456', '12987654321', '987.654.321-10'),
(2, 2, 'Roberto Carlos', '1990-03-11', 'Avenida Vicente de Carvalho, 943', '13981107479', '440.424.657-30'),
(3, 3, 'Carlos Eduardo', '1990-11-15', 'Rua Madeira, 431', '13903458973', '371.862.933-44'),
(4, 4, 'Mariana Silva', '1988-07-22', 'Avenida Nascimento, 202', '11912637578', '762.333.464-55'),
(5, 5, 'Fernanda Oliveira', '1995-03-30', 'Rua Ouro rosa, 33', '12944345568', '863.443.543-16'),
(6, 6, 'Heloisa Castro', '1982-05-10', 'Avenida Prismatica, 404', '11912342558', '734.845.126-57'),
(7, 7, 'Marcel Duarte', '2013-03-11', 'Avenida Vicente de Carvalho, 900', '13981107479', '440.424.657-00'),
(8, 8, 'Tiago Sabino', '2005-03-16', 'Rua Jaragua, 64', '11985029631', '432.124.847-00'),
(9, 9, 'Gabriel Gallo', '2005-01-26', 'Avenida Fazenda, 321', '11960340272', '732.324.547-00'),
(10, 10, 'Guilherme Pimenta', '2005-03-21', 'Avenida Picante, 71', '11949641083', '532.624.127-00');

INSERT INTO triagem (id_triagem, id_paciente, id_enfermeiro, data_triagem, hora_triagem, sintomas, sinais_vitais, prioridade)
VALUES
(1, 1, 1, '2025-01-24', '08:30:00', 'Febre, tosse', 'Pressão arterial: 120/80, Pulso: 80 bpm', 2),
(2, 2, 7, '2025-01-24', '09:00:00', 'Dor de cabeça, náusea', 'Pressão arterial: 130/85, Pulso: 75 bpm', 3),
(3, 3, 1, '2025-01-24', '09:30:00', 'Dor abdominal, vômito', 'Pressão arterial: 110/70, Pulso: 90 bpm', 1),
(4, 4, 9, '2025-01-24', '10:00:00', 'Fadiga, tontura', 'Pressão arterial: 115/75, Pulso: 85 bpm', 2),
(5, 5, 9, '2025-01-24', '10:30:00', 'Dor no peito, falta de ar', 'Pressão arterial: 140/90, Pulso: 95 bpm', 1),
(6, 6, 8, '2025-01-24', '11:00:00', 'Dores nas partes intimas', 'Pressão arterial: 125/80, Pulso: 70 bpm', 2),
(7, 7, 2, '2025-01-24', '11:30:00', 'febre', 'Pressão arterial: 130/85, Pulso: 88 bpm', 3),
(8, 8, 8, '2025-01-24', '12:00:00', 'Náusea, dor de estômago', 'Pressão arterial: 115/75, Pulso: 80 bpm', 2),
(9, 9, 9, '2025-01-24', '10:30:00', 'Dor nas costas, dificuldade para se mover', 'Pressão arterial: 120/80, Pulso: 78 bpm', 2),
(10, 10, 7, '2025-01-24', '11:00:00', 'Erupção cutânea, coceira intensa', 'Pressão arterial: 115/75, Pulso: 72 bpm', 3); 

INSERT INTO consulta (id_consulta, id_paciente, id_medico, id_enfermeiro, id_receita, id_sala, data_consulta, hora)
VALUES
(1, 1, 1, 1, 1, 1, '2025-01-24', '09:30:00'), -- Paciente 1 com febre e tosse, consulta com Dr. Pedro Santos (Cardiologia)
(2, 2, 2, 7, 2, 2, '2025-01-24', '09:30:00'), -- Paciente 2 com dor de cabeça e náusea, consulta com Dra. Laura Mendes (Neurologia)
(3, 3, 5, 1, 3, 3, '2025-01-24', '10:30:00'), -- Paciente 3 com dor abdominal e vômito, consulta com Dr. Marcelo Oliveira (Gastroenterologia)
(4, 4, 1, 9, 4, 1, '2025-01-24', '11:00:00'), -- Paciente 4 com fadiga e tontura, consulta com Dr. Pedro Santos (Cardiologia)
(5, 5, 1, 9, 5, 1, '2025-01-24', '11:30:00'), -- Paciente 5 com dor no peito e falta de ar, consulta com Dr. Pedro Santos (Cardiologia)
(6, 6, 6, 8, 6, 4, '2025-01-25', '12:00:00'), -- Paciente 6 com dores nas partes intimas, consulta com Dra. Juliana Ribeiro (Ginecologista)
(7, 7, 7, 2, 7, 5, '2025-01-25', '12:00:00'), -- Paciente 7 com febre, consulta com Dr. Eduardo Santos (Pediatria)
(8, 8, 5, 8, 8, 3, '2025-01-25', '12:30:00'), -- Paciente 8 com náusea e dor de estômago, consulta com Dr. Marcelo Oliveira (Gastroenterologia)
(9, 9, 3, 9, 9, 6, '2025-01-25', '10:30:00'), -- Paciente 9 com dor nas costas, dificuldade para se mover, consulta com Dr. Ricardo Almeida (Ortopedia)
(10, 10, 4, 7, 10, 7, '2025-01-25', '09:00:00'); -- Paciente 10 com erupção cutânea e coceira intensa, consulta com Dra. Fernanda Costa (Dermatologia)

INSERT INTO medico (id_medico, id_historico, especialidade, nascimento, endereco, telefone, email, cre, nome)
VALUES
(1, 1, 'Cardiologia', '1975-03-10', 'Rua Consolação, 789', '12901892405', 'pedro1@hospital.com', 'CRE789', 'Dr. Pedro Santos'),
(2, 2, 'Neurologia', '1982-07-22', 'Avenida Diamantina, 431', '13994528183', 'laura2@hospital.com', 'CRE456', 'Dra. Laura Mendes'),
(3, 3, 'Ortopedia', '1978-11-05', 'Rua Emanuel Tavares, 284', '11949641083', 'ricardo.almeida@hospital.com', 'CRE101', 'Dr. Ricardo Almeida'),
(4, 4, 'Dermatologia', '1985-04-12', 'Rua Figaro, 653', '11953669243', 'fernanda.costa@hospital.com', 'CRE202', 'Dra. Fernanda Costa'),
(5, 5, 'Gastroenterologia', '1979-09-23', 'Avenida Guarapiranga, 424', '11946356085', 'marcelo.oliveira@hospital.com', 'CRE303', 'Dr. Marcelo Oliveira'),
(6, 6, 'Ginecologia', '1983-02-17', 'Rua Helipa, 55', '13949636056', 'juliana.ribeiro@hospital.com', 'CRE404', 'Dra. Juliana Ribeiro'),
(7, 7, 'Pediatria', '1976-06-30', 'Rua India, 536', '11943535367', 'eduardo.santos@hospital.com', 'CRE505', 'Dr. Eduardo Santos'),
(8, 8, 'Oncologia', '1981-08-25', 'Rua João Batista, 347', '11935541088', 'patricia.lima@hospital.com', 'CRE606', 'Dra. Patrícia Lima'),
(9, 9, 'Psiquiatria', '1987-12-14', 'Rua Vicente Alves, 86', '12949645439', 'andre.souza@hospital.com', 'CRE707', 'Dr. André Souza'),
(10, 10, 'Urologia', '1984-03-19', 'Rua Lazaro, 943', '12944344590', 'mariana.ferreira@hospital.com', 'CRE808', 'Dra. Mariana Ferreira'),
(11, 11, 'Neurocirugia', '2004-03-26', 'Rua Coreio do Rio, 708', '11971840225', 'andrestitch@hospital.com', 'CRE626', 'Dr. Andre Stitch');

INSERT INTO sala (id_sala, numero_sala, andar, tipo_sala)
VALUES
(1, '1', 1, 'Consulta'),
(2, '2', 1, 'Consulta'),
(3, '3', 1, 'Consulta'),
(4, '4', 1, 'Consulta'),
(5, '5', 1, 'Consulta'),
(6, '6', 1, 'Consulta'),
(7, '7', 1, 'Consulta'),
(8, '8', 1, 'Consulta'),
(9, '9', 1, 'Consulta'),
(10, '10', 1, 'Consulta'),
(11, '11', 1, 'Consulta');

INSERT INTO equipamentos_medicos (id_equipamentos, id_sala, nome_equipamento, status_equipamento, data_aquisicao)
VALUES
(1, 1, 'Monitor Cardíaco', 'Em uso', '2023-01-15'),
(2, 1, 'Desfibrilador', 'Em uso', '2023-02-20'),
(3, 2, 'Ventilador Mecânico', 'Em uso', '2024-03-10'),
(4, 2, 'Eletroencefalograma', 'Em uso', '2023-04-05'),
(5, 3, 'Eletrocardiógrafo', 'Em uso', '2021-05-12'),
(6, 3, 'Oxímetro de Pulso', 'Em uso', '2023-06-18'),
(7, 4, 'Ultrassom', 'Em uso', '2024-07-22'),
(8, 4, 'Aparelho de Raio-X', 'Em uso', '2023-08-30'),
(9, 5, 'Tomógrafo', 'Em uso', '2023-09-15'),
(10, 5, 'Máquina de Hemodiálise', 'Em uso', '2022-10-10'),
(11, 6, 'Monitor de Pressão Arterial', 'Em uso', '2020-11-05'),
(12, 6, 'Ventilador Portátil', 'Em uso', '2023-12-01'),
(13, 7, 'Máquina de Ultrassom Portátil', 'Em uso', '2019-01-20'),
(14, 7, 'Desfibrilador Externo Automático', 'Em uso', '2018-02-25'),
(15, 8, 'Máquina de Infusão', 'Em uso', '2020-10-12'),
(16, 8, 'Cadeira de Tratamento', 'Em uso', '2021-05-27'),
(17, 9, 'Cadeira de Terapia', 'Em uso', '2023-08-05'),
(18, 9, 'Computador com Software de Registro Médico', 'Em uso', '2022-01-27'),
(19, 10, 'Cistoscópio', 'Em uso', '2024-04-18'),
(20, 10, 'Ultrassom', 'Em uso', '2022-03-07'),
(21, 11, 'Microscópio Cirúrgico', 'Em uso', '2021-10-28'),
(22, 11, 'Sistema de Navegação Cirúrgica', 'Em uso', '2023-07-17');

INSERT INTO medicamentos (id_medicamentos, nome_medicamento, efeitos_colaterais, quantidade)
VALUES
(1, 'Paracetamol', 'Náusea, tontura', 100),
(2, 'Ibuprofeno', 'Dor de estômago, dor de cabeça', 200),
(3, 'Atenolol', 'Fadiga, tontura', 150),
(4, 'Enalapril', 'Tosse, tontura', 120),
(5, 'Gabapentina', 'Sonolência, tontura', 100),
(6, 'Carbamazepina', 'Náusea, sonolência', 80),
(7, 'Cisplatina', 'Náusea, perda de apetite', 60),
(8, 'Doxorrubicina', 'Náusea, perda de cabelo', 70),
(9, 'Fluoxetina', 'Insônia, náusea', 90),
(10, 'Clonazepam', 'Sonolência, tontura', 110),
(11, 'Tamsulosina', 'Tontura, dor de cabeça', 130),
(12, 'Finasterida', 'Redução da libido, tontura', 140),
(13, 'Manitol', 'Urina em excesso, Sede excessiva', 50);

INSERT INTO entrada_saida (id_entrada_saida, id_medicamentos, id_fornecedor, tipo_movimentacao, data_movimentacao, observacoes)
VALUES
(1, 1, 1, 'Entrada', '2025-01-20', 'Recebido do fornecedor A'),
(2, 2, 2, 'Saída', '2025-01-21', 'Distribuído para a ala B');

INSERT INTO responsavel (id_responsavel, telefone, email, turma, nome, cargo, cpf)
VALUES
(1, '11987654321', 'pedro30@hospital.com', 'A', 'Pedro Almeida', 'Repositor', '321.654.987-00'),
(2, '11976543210', 'joãovitor21@hospital.com', 'B', 'João Vitor', 'Repositor', '654.321.987-00');

INSERT INTO movimentacao_estoque (id_movimentacao, id_estoque, id_responsavel, quantidade, data_movimentacao, tipo_movimentacao)
VALUES
(1, 1, 1, 50, '2025-01-22', 'Entrada'),
(2, 2, 2, 30, '2025-01-23', 'Saída');

INSERT INTO estoque_medicamentos (id_estoque, id_medicamentos, id_fornecedor, localizacao, quantidade, data_validade, data_fabricacao, status_medicamentos)
VALUES
(1, 1, 1, 'Ala A', 100, '2026-01-20', '2024-01-20', 'Disponível'),
(2, 2, 2, 'Ala B', 200, '2026-02-20', '2024-02-20', 'Disponível');

INSERT INTO pedido_medicamentos (id_pedido, id_medicamentos, id_fornecedor, data_pedido, data_entrega, status_pedido, nota_fiscal)
VALUES
(1, 1, 1, '2025-01-15', '2025-01-20', 'Entregue', 'NF12345'),
(2, 2, 2, '2025-01-16', '2025-01-21', 'Entregue', 'NF67890');

INSERT INTO fornecedor (id_fornecedor, nome, cnpj, endereco, telefone)
VALUES
(1, 'profarma', '45.453.214/0001-51', 'Rua Olimpíadas, 100', '114486-1121'),
(2, 'Santa Cruz', '23.535.727/0001-79', 'Avenida Imperatriz Leopoldina, 1075', '1130407500');

SELECT * FROM enfermeiro;
SELECT * FROM triagem;
SELECT * FROM paciente;
SELECT * FROM consulta;
SELECT * FROM medico;
SELECT * FROM sala;
SELECT * FROM equipamentos_medicos;
SELECT * FROM medicamentos;
SELECT * FROM entrada_saida;
SELECT * FROM responsavel;
SELECT * FROM movimentacao_estoque;
SELECT * FROM estoque_medicamentos;
SELECT * FROM pedido_medicamentos;
SELECT * FROM fornecedor;
