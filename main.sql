-- Tabela de sequence (AUTO INCREMENT)
create sequence auto_increment
    start with 1
    increment by 1
    maxvalue 9999;

-- Cadastrar Paciente
create table cadastrarpaciente (
    ra int primary key,
    nome varchar(90) not null,
    rg char(10) not null unique,
    cpf char(14) not null unique,
    genero char(1) not null,
    rua varchar(20) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    email varchar(200) not null,
    telefone char(12),
    data_nascimento date not null
);

-- Registrar Funcionario
create table cadastrarfuncionario (
    rf int primary key,
    nome varchar(90) not null,
    rg char(10) not null unique,
    cpf char(14) not null unique,
    genero char(1) not null,
    rua varchar(150) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    email varchar(200),
    telefone char(12),
    formacao varchar(60) not null,
    setor varchar(25) not null,
    turno varchar(20) not null,
    salario float not null,
    cargo varchar(20),
    data_nascimento date not null
);

-- Tabela intermediaria de funcionario e triagem / consulta
create table funcionariosConsultasTriagem (
    id_consultaTriagem int not null,
    rf_funcionario int not null,
    tipo varchar(50) not null,
    foreign key (id_consultaTriagem) references consultatriagem (id),
    foreign key (rf_funcionario) references cadastrarfuncionario (rf)
);

-- Marca consulta ou triagem
CREATE TABLE consultatriagem (
    id int PRIMARY KEY,
    ra_paciente int NOT NULL,
    tipoconsulta varchar(15) NOT NULL,
    alergias char(4),
    febre char(4),
    tosse char(4),
    fadiga char(4),
    nausea char(4),
    vomitos char(4),
    diarreia char(4),
    calafrios char(4),
    dorsnasarticulacoes char(4),
    dificuldaderespiratoria char(4),
    perdodopaladarouolfato char(4),
    congestaonasal char(4),
    rf_enfermeiro int NOT NULL,
    horario_triagem char(5) NOT NULL,
    data date NOT NULL,
    rf_medico int NOT NULL,
    horario_consulta char(5),
    horario_consulta_inicio char(5),
    horario_consulta_termino char(5) NULL,
    nivelurgencia varchar(15),
    sintomas_especificos varchar(25),
    condicoes_pre_existentes varchar(25),
    medicacoes varchar(25),
    observacoes_adicionais varchar(50),
    situacao VARCHAR(10) DEFAULT 'Realizado',
    CHECK((horario_consulta_inicio IS NOT NULL AND horario_consulta_termino IS NOT NULL) 
    OR (horario_consulta_inicio IS NULL AND status = 'Cancelado')),
    FOREIGN KEY (ra_paciente) REFERENCES cadastrarpaciente(ra),
    FOREIGN KEY (rf_medico) REFERENCES cadastrarfuncionario(rf),
    FOREIGN KEY (rf_enfermeiro) REFERENCES cadastrarfuncionario(rf)
);


-- Obitos
create table obitos(
    id int primary key,
    causaDaMorte varchar(40) not null,
    id_consultaOrTriagem int unique not null,
    horaDoObito char(5) not null,
    data date,
    foreign key (id_consultaOrTriagem) references consultatriagem(id)
);

-- INSERT 

-- cadastrar paciente 
insert into cadastrarpaciente(ra, 
    nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento, 
    email, telefone, 
    data_nascimento)
values (
	auto_increment.nextval,
    'Lucas', 1234567890, 45602588675,'M',
    'Rua aaa', 'Jardim bbc', 'SP', 'Embu', 06587452,11, 'Complemento',
    'Email@email.com', 11950735140,
    to_date('2020-07-20', 'YYYY/MM/DD')
);

INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'João Silva', 123456789, 98765432100, 'M', 'Rua A', 'Centro', 'SP', 'São Paulo', 01234567, 123, 'Apto 101', 'joao@email.com', 11987654321, to_date('1990-03-15', 'YYYY-MM-DD')
);

INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Maria Oliveira', 987654321, 12309876543, 'F', 'Rua B', 'Jardim', 'RJ', 'Rio de Janeiro', 04567890, 456, 'Casa 20', 'maria@email.com', 11876543210, to_date('1985-08-22', 'YYYY-MM-DD')
);

INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Carlos Santos', 456789012, 56789012345, 'M', 'Rua C', 'Barra', 'BA', 'Salvador', 03456789, 789, 'Apto 303', 'carlos@email.com', 11901234567, to_date('1998-12-10', 'YYYY-MM-DD')
);

INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Ana Oliveira', 789012345, 12398765432, 'F', 'Rua D', 'Copacabana', 'RJ', 'Rio de Janeiro', 06789012, 101, 'Casa 15', 'ana@email.com', 11901234567, to_date('1992-05-18', 'YYYY-MM-DD')
);

INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Gabriel Lima', 123426789, 44321098765, 'M', 'Rua Q', 'Morumbi', 'SP', 'São Paulo', 03210987, 678, 'Apto 401', 'gabriel@email.com', 11876543210, to_date('1988-06-15', 'YYYY-MM-DD')
);

-- Paciente 18
INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Aline Oliveira', 234567830, 31109876543, 'F', 'Rua R', 'Campo Limpo', 'SP', 'São Paulo', 09876543, 901, 'Casa 18', 'aline@email.com', 11901234567, to_date('1990-01-20', 'YYYY-MM-DD')
);

-- Paciente 19
INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Pedro Santos', 563890123, 43210987154, 'M', 'Rua S', 'Vila Leopoldina', 'SP', 'São Paulo', 07654321, 234, 'Apto 501', 'pedro@email.com', 11987654321, to_date('1985-03-18', 'YYYY-MM-DD')
);

-- Paciente 20
INSERT INTO cadastrarpaciente (
    ra, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, data_nascimento
) VALUES (
    auto_increment.nextval, 'Mariana Oliveira', 6789012134,11098765432, 'F', 'Rua T', 'Santana', 'SP', 'São Paulo', 08765432, 345, 'Casa 16', 'mariana@email.com', 11876543210, to_date('1992-09-10', 'YYYY-MM-DD')
);


-- cadastrar funcionario

INSERT INTO cadastrarfuncionario (
    rf, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, formacao, setor, turno, salario, cargo, data_nascimento
) VALUES (
    auto_increment.nextval, 'Dr. Roberto Santos', '1234567890', '98765432101', 'M',
    'Avenida Principal', 'Centro', 'SP', 'São Paulo', '01234567', '101', 'Sala 3',
    'roberto@email.com', '11987654321', 'Médico', 'Cardiologia', 'Manhã', 15000.00, 'Cardiologista',
    to_date('1975-02-10', 'YYYY-MM-DD')
);

INSERT INTO cadastrarfuncionario (
    rf, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, formacao, setor, turno, salario, cargo, data_nascimento
) VALUES (
    auto_increment.nextval, 'Enf. Ana Oliveira', '987654321', '12309876543', 'F',
    'Rua B', 'Jardim', 'RJ', 'Rio de Janeiro', '04567890', '456', 'Casa 20',
    'ana_enfermeiro@email.com', '11876543210', 'Enfermagem', 'Emergência', 'Noite', 6000.00, 'Enfermeiro',
    to_date('1985-08-22', 'YYYY-MM-DD')
);

INSERT INTO cadastrarfuncionario (
    rf, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, formacao, setor, turno, salario, cargo, data_nascimento
) VALUES (
    auto_increment.nextval, 'Dra. Maria Silva', '456789012', '56789012345', 'F',
    'Rua C', 'Barra', 'BA', 'Salvador', '03456789', '789', 'Apto 303',
    'maria@email.com', '11901234567', 'Médico', 'Pediatria', 'Tarde', 12000.00, 'Pediatra',
    to_date('1998-12-10', 'YYYY-MM-DD')
);

INSERT INTO cadastrarfuncionario (
    rf, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, formacao, setor, turno, salario, cargo, data_nascimento
) VALUES (
    auto_increment.nextval, 'Enf. Carlos Santos', '890123456', '21098765432', 'M',
    'Rua D', 'Copacabana', 'RJ', 'Rio de Janeiro', '06789012', '101', 'Casa 15',
    'carlos_enfermeiro@email.com', '11901234567', 'Enfermagem', 'UTI', 'Noite', 5500.00, 'Enfermeiro',
    to_date('1992-05-18', 'YYYY-MM-DD')
);

INSERT INTO cadastrarfuncionario (
    rf, nome, rg, cpf, genero,
    rua, bairro, estado, cidade, cep, numero, complemento,
    email, telefone, formacao, setor, turno, salario, cargo, data_nascimento
) VALUES (
    auto_increment.nextval, 'Dr. Lucas Pereira', '234567890', '87654321098', 'M',
    'Rua E', 'Morumbi', 'SP', 'São Paulo', '02345678', '567', 'Apto 502',
    'lucas@email.com', '11987654321', 'Médico', 'Ortopedia', 'Manhã', 16000.00, 'Ortopedista',
    to_date('1987-11-30', 'YYYY-MM-DD')
);


select rf, cargo from cadastrarfuncionario;
select ra from cadastrarpaciente;
select id from consultatriagem;

-- consulta / triagem
INSERT INTO consultatriagem (
    id, ra_paciente, tipoconsulta, alergias, febre, tosse, fadiga,
    nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data, rf_medico, horario_consulta,
    horario_consulta_inicio, horario_consulta_termino, nivelurgencia,
    sintomas_especificos, condicoes_pre_existentes, medicacoes,
    observacoes_adicionais
) VALUES (
    auto_increment.nextval, 1, 'triagem', 'Não', 'Não', 'Não', 'Não', 'Não',
    'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 37, '08:30',
    to_date('2023-11-17', 'YYYY/MM/DD'), 34, '09:00', '09:15', '09:30', 'Normal',
    'Nenhum', 'Nenhuma', 'Nenhuma', 'Nenhuma'
);

INSERT INTO consultatriagem (
    id, ra_paciente, tipoconsulta, alergias, febre, tosse, fadiga,
    nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data, rf_medico, horario_consulta,
    horario_consulta_inicio, horario_consulta_termino, nivelurgencia,
    sintomas_especificos, condicoes_pre_existentes, medicacoes,
    observacoes_adicionais
) VALUES (
    auto_increment.nextval, 1, 'Consulta', 'Não', 'Não', 'Não', 'Não', 'Não',
    'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 35, '10:45',
    to_date('2023-11-17', 'YYYY/MM/DD'), 38, '11:30', '11:45', '12:00', 'Urgente',
    'Dor no peito', 'Hipertensão', 'Aspirina', 'Paciente relatou dor intensa no peito.'
);

INSERT INTO consultatriagem (
    id, ra_paciente, tipoconsulta, alergias, febre, tosse, fadiga,
    nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data, rf_medico, horario_consulta,
    horario_consulta_inicio, horario_consulta_termino, nivelurgencia,
    sintomas_especificos, condicoes_pre_existentes, medicacoes,
    observacoes_adicionais
) VALUES (
    auto_increment.nextval, 3, 'Consulta', 'Não', 'Sim', 'Sim', 'Não', 'Sim',
    'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 35, '14:00',
    to_date('2023-11-17', 'YYYY/MM/DD'), 34, '14:30', '14:45', '15:00', 'Normal',
    'Febre e tosse', 'Nenhuma', 'Tylenol', 'Criança com sintomas gripais.'
);

INSERT INTO consultatriagem (
    id, ra_paciente, tipoconsulta, alergias, febre, tosse, fadiga,
    nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data, rf_medico, horario_consulta,
    horario_consulta_inicio, horario_consulta_termino, nivelurgencia,
    sintomas_especificos, condicoes_pre_existentes, medicacoes,
    observacoes_adicionais
) VALUES (
    auto_increment.nextval, 4, 'Consulta', 'Não', 'Não', 'Não', 'Não', 'Não',
    'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 37, '16:30',
    to_date('2023-11-17', 'YYYY/MM/DD'), 38, '17:15', '17:30', '17:45', 'Normal',
    'Nenhum', 'Nenhuma', 'Nenhuma', 'Exame de rotina.'
);

-- Consulta cancelada
INSERT INTO consultatriagem (
    id, ra_paciente, tipoconsulta, alergias, febre, tosse, fadiga,
    nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data, rf_medico, horario_consulta,
    nivelurgencia,
    sintomas_especificos, condicoes_pre_existentes, medicacoes,
    observacoes_adicionais, status
) VALUES (
    auto_increment.nextval, 1, 'Consulta', 'Não', 'Não', 'Não', 'Não', 'Não',
    'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 'Não', 37, '09:00',
    to_date('2023-11-17', 'YYYY/MM/DD'), 36, '09:45', 'Normal',
    'Visão embaçada', 'Nenhuma', 'Nenhuma', 'Exame de vista de rotina.', 'Cancelado'
);

-- insert de obito
INSERT INTO obitos (id, causaDaMorte, id_consultaOrTriagem, horaDoObito, data)
VALUES (auto_increment.nextval, 'Parada cardíaca', 39, '15:30', TO_DATE('2023-11-17', 'YYYY/MM/DD'));

INSERT INTO obitos (id, causaDaMorte, id_consultaOrTriagem, horaDoObito, data)
VALUES (auto_increment.nextval, 'Insuficiência respiratória', 40, '18:45', TO_DATE('2023-11-18', 'YYYY/MM/DD'));

INSERT INTO obitos (id, causaDaMorte, id_consultaOrTriagem, horaDoObito, data)
VALUES (auto_increment.nextval, 'Acidente vascular cerebral', 60, '12:15', TO_DATE('2023-11-19', 'YYYY/MM/DD'));

INSERT INTO obitos (id, causaDaMorte, id_consultaOrTriagem, horaDoObito, data)
VALUES (auto_increment.nextval, 'Septicemia', 61, '21:10', TO_DATE('2023-11-20', 'YYYY/MM/DD'));

INSERT INTO obitos (id, causaDaMorte, id_consultaOrTriagem, horaDoObito, data)
VALUES (auto_increment.nextval, 'Falência múltipla de órgãos', 62, '09:00', TO_DATE('2023-11-21', 'YYYY/MM/DD'));

-- Inserções na tabela funcionariosConsultasTriagem
INSERT INTO funcionariosConsultasTriagem (id_consultaTriagem, rf_funcionario, tipo) VALUES (39, 36, 'Triagem');
INSERT INTO funcionariosConsultasTriagem (id_consultaTriagem, rf_funcionario, tipo) VALUES (62, 37, 'Consulta');
INSERT INTO funcionariosConsultasTriagem (id_consultaTriagem, rf_funcionario, tipo) VALUES (60, 34, 'Triagem');
INSERT INTO funcionariosConsultasTriagem (id_consultaTriagem, rf_funcionario, tipo) VALUES (40, 35, 'Consulta');

-- SELECTS 
-- Consulta de Tipos e Quantidade de Triagens
SELECT tipo, COUNT(*) as total_triagens
FROM funcionariosConsultasTriagem
GROUP BY tipo;

-- Consulta de Média Salarial por Cargo
SELECT cargo, AVG(salario) as media_salarial
FROM cadastrarfuncionario
GROUP BY cargo;

-- Consulta de Média de Mortes por Doença
SELECT causaDaMorte, COUNT(*) as total_mortes
FROM obitos
GROUP BY causaDaMorte;

-- Histórico de Funcionários
SELECT
    cf.rf as rf_funcionario,
    cf.nome as nome_funcionario,
    cf.setor,
    cf.cargo,
    cf.salario,
    cf.turno
FROM
    cadastrarfuncionario cf
JOIN
    funcionariosConsultasTriagem fct ON cf.rf = fct.rf_funcionario;

-- Histórico do Paciente
SELECT 
    c.id AS id_consulta,
    p.ra AS ra_paciente,
    p.nome AS nome_paciente,
    c.data,
    c.horario_consulta,
    c.horario_consulta_inicio,
    c.horario_consulta_termino,
    c.situacao,
    c.tipoconsulta,
    c.observacoes_adicionais,
    c.medicacoes
FROM 
    consultatriagem c
JOIN 
    cadastrarpaciente p ON c.ra_paciente = p.ra
WHERE 
    p.ra = 4
    AND c.tipoconsulta LIKE '%Consulta%'
ORDER BY 
    c.data DESC;

-- Checar Consultas/Pacientes
SELECT 
    c.id,
    c.ra_paciente,
    p.nome AS nome_paciente,
    c.data,
    c.horario_consulta,
    c.horario_consulta_inicio,
    c.horario_consulta_termino,
    c.situacao,
    c.tipoconsulta
FROM 
    consultatriagem c
JOIN
    cadastrarpaciente p ON c.ra_paciente = p.ra
WHERE 
    c.tipoconsulta LIKE '%Consulta%';

-- Checar Triagem
SELECT 
    id, ra_paciente, data, horario_triagem, alergias, febre, tosse, nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes, dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal 
FROM 
    consultatriagem
WHERE 
    tipoconsulta LIKE '%triagem%';

-- Consulta de Óbitos
SELECT * FROM obitos;

-- Query de Login
SELECT rf 
FROM cadastrarfuncionario
WHERE cpf = '12345678901'
AND data_nascimento = to_date('2023-12-29', 'YYYY/MM/DD');

-- Query de Recuperar Senha
SELECT rf
FROM cadastrarfuncionario
WHERE rg = '1234567890' 
  AND cpf = '98765432101'
  AND data_nascimento = to_date('2004-06-29', 'YYYY/MM/DD');


-- Exclui as tabelas
DROP TABLE consultatriagem;
DROP TABLE cadastrarpaciente;
DROP TABLE cadastrarfuncionario;
DROP TABLE funcionariosConsultasTriagem;
DROP TABLE obitos;
DROP SEQUENCE auto_increment;