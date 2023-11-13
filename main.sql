-- Tabela sequencia

create sequence auto_increment
    start with 1
    increment by 1
    maxvalue 9999; -- Auto Increment

-- Criando tabelas

create table cadastrapaciente (
    ra int primary key,
    nome varchar(90) not null,
    rg char(10) not null unique,
    cpf char(14) not null unique, 
    genero char(1) not null,
    endereco varchar(150) not null,
    rua varchar(30) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    formadepagamento varchar(30) not null,
    email varchar(200) not null
); -- Cadastrar Paciente

create table funcionariosConsultasTriagem(
    id_consultaTriagem int not null,
    rf_funcionario int not null,
    tipo varchar(50) not null,
    foreign key(id_consultaTriagem) references consultatriagem(id),
    foreign key(rf_funcionario) references cadastrarfuncionario(rf)
 ); -- tabela intermediario de funcionario e consulta e triagem

create table cadastrarfuncionario (
    rf int default auto_increment.nextval primary key,
    nome varchar(90) not null,
    rg char(10) not null unique,
    cpf char(14) not null unique, 
    genero char(1) not null,
    endereco varchar(150) not null,
    rua varchar(30) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    formadepagamento varchar(30) not null,
    email varchar(200) not null,
    setor varchar(25) not null,
    turno varchar(20) not null,
    salario float not null
); -- Cadastrar Funcionario

create table consultatriagem (
    id int primary key,
    ra_paciente int not null,
    tipoconsulta varchar(15) not null,
    alergias char(3) not null,
    febre char(3) not null,
    tosse char(3) not null,
    fadiga char(3) not null,
    nausea char(3) not null,
    vomitos char(3) not null,
    diarreia char(3) not null,
    calafrios char(3) not null,
    dorsnasarticulacoes char(3) not null,
    dificuldaderespiratoria char(3) not null,
    perdodopaladarouolfato char(3) not null,
    congestaonasal char(3) not null,
    rf_enfermeiro int not null,
    horario_triagem char(5) not null,
    data date not null,
    rf_medico int not null,
    horario_consulta char(5) not null,
    horario_consulta_inicio char(5) not null,
    horario_consulta_termino char(5) not null,
    valor_consulta float not null,
    formadepagamento varchar(25) not null,
    foreign key (ra_paciente) references cadastrapaciente(ra),
    foreign key (rf_medico) references cadastrarfuncionario(rf),
    foreign key (rf_enfermeiro) references cadastrarfuncionario(rf)
); -- Cadastrar Consulta ou Triagem

create table obitos(
    id int default auto_increment.nextval primary key,
    causaDaMorte varchar(50) not null,
    horaDoObito char(5) not null,
    data date not null,
    id_consultaTriagem int not null,
    foreign key(id_consultaTriagem) references consultatriagem(id)
); -- Registrar um obito


-- SELECT's

-- Query de triagem
select id, ra_paciente, rf_enfermeiro, horario_triagem, data, alergias, febre, tosse, fadiga, nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes, dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal
    from consultatriagem; -- busca de dados da triagem

-- Query de consulta
select id, ra_paciente, rf_medico, horario_consulta, horario_consulta_inicio,data, horario_consulta_termino, formadepagamento, valor_consulta 
    from consultatriagem; -- busca de dados da consulta

-- INSERT's

-- marcando consulta e triagem
INSERT INTO consultatriagem (id, ra_paciente, tipoconsulta, 
    alergias, febre, tosse, fadiga, nausea, vomitos, diarreia, calafrios, dorsnasarticulacoes, dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal, 
    rf_enfermeiro, horario_triagem, 
    data, 
    rf_medico, 
    horario_consulta, horario_consulta_inicio, horario_consulta_termino, 
    valor_consulta, formadepagamento)
VALUES (2,
    	47, 
    	'Triagem',
    	'Sim', 'Não', 'Sim', 'Não', 'Não', 'Não', 'Não', 'Sim', 'Não', 'Não', 'Sim', 'Não',
    	44, '08:00',
    	to_date('2023-11-13', 'YYYY-MM-DD'),
    	45,
    	'10:00', '10:30', '11:00',
    	50.00, 'Dinheiro'); -- marca consulta e triagem

-- cadastrar enfermeiro
INSERT INTO cadastrarfuncionario (nome, rg, cpf, genero, endereco, rua, bairro, estado, cidade, cep, numero, complemento, email, setor, turno, salario)
VALUES ('Enfermeiro Exemplo',
    '9876543210',
    '987.654.321-01',
    'M',
    'Endereço do Enfermeiro',
    'Rua do Enfermeiro',
    'Bairro do Enfermeiro',
    'Estado do Enfermeiro',
    'Cidade do Enfermeiro',
    '87654321',
    '987',
    'Complemento do Enfermeiro',
    'enfermeiro@example.com',
    'Triagem',
    'Diurno',
    5000.00); -- enfermeiro 

-- cadastrar medico
INSERT INTO cadastrarFuncionario (nome, rg, cpf, genero, endereco, rua, bairro, estado, cidade, cep, numero, complemento, email, setor, turno, salario)
VALUES ('Dr. João Silva', 
    	'1234567890', 
    	'123.456.789-01', 
    	'M', 
    	'Rua Hospitalar',
    	'Avenida da Saúde',
    	'Bairro da Cura',
    	'Estado da Medicina', 
    	'Cidade da Saúde', 
    	'12345678', 
    	'123', 
    	'Próximo à Emergência', 
    	'drjoao@example.com',
    	'Consulta',
    	'Diurno',
    	9000.00); -- medico


-- Cadastrar paciente
INSERT INTO cadastrapaciente (ra, nome, rg, cpf, genero, endereco, rua, bairro, estado, cidade, cep, numero, complemento, formadepagamento, email)
VALUES (auto_increment.nextval, 
    	'Nome do Paciente', 
    	'1234562890', 
    	'223.456.789-01', 
    	'M', 
    	'Endereço do Paciente', 	
   	 	'Rua do Paciente', 
    	'Bairro do Paciente', 
    	'Estado do Paciente', 
    	'Cidade do Paciente', 
    	'12345678', 
    	'123', 
    	'Complemento do Paciente', 
    	'Forma de Pagamento do Paciente', 
    	'paciente@example.com'); -- paciente

-- ALTER TABLE's
ALTER TABLE consultatriagem modify febre char(4);
ALTER TABLE consultatriagem modify fadiga char(4);
ALTER TABLE consultatriagem modify nausea char(4);
ALTER TABLE consultatriagem modify vomitos char(4);
ALTER TABLE consultatriagem modify diarreia char(4);
ALTER TABLE consultatriagem modify calafrios char(4);
ALTER TABLE consultatriagem modify dorsnasarticulacoes char(4);
ALTER TABLE consultatriagem modify dificuldaderespiratoria char(4);
ALTER TABLE consultatriagem modify perdodopaladarouolfato char(4);
ALTER TABLE consultatriagem modify congestaonasal char(4);
