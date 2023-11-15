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
    endereco varchar(150) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    formadepagamento varchar(30) not null,
    email varchar(200) not null,
    telefone char(12)
);

-- Registrar Funcionario
create table cadastrarfuncionario (
    rf int primary key,
    nome varchar(90) not null,
    rg char(10) not null unique,
    cpf char(14) not null unique, 
    genero char(1) not null,
    endereco varchar(150) not null,
    bairro varchar(30) not null,
    estado varchar(20) not null,
    cidade varchar(20) not null,
    cep char(8) not null,
    numero varchar(5) not null,
    complemento varchar(25),
    formadepagamento varchar(30) not null,
    email varchar(200),
    telefone char(12),
    formacao varchar(60) not null,
    setor varchar(25) not null,
    turno varchar(20) not null,
    salario float not null,
    cargo varchar(20)
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
create table consultatriagem (
    id int primary key,
    ra_paciente int not null,
    tipoconsulta varchar(15) not null,
    alergias char(4) not null,
    febre char(4) not null,
    tosse char(4) not null,
    fadiga char(4) not null,
    nausea char(4) not null,
    vomitos char(4) not null,
    diarreia char(4) not null,
    calafrios char(4) not null,
    dorsnasarticulacoes char(4) not null,
    dificuldaderespiratoria char(4) not null,
    perdodopaladarouolfato char(4) not null,
    congestaonasal char(4) not null,
    rf_enfermeiro int not null,
    horario_triagem char(5) not null,
    data date not null,
    rf_medico int not null,
    horario_consulta char(5) not null,
    horario_consulta_inicio char(5) not null,
    horario_consulta_termino char(5) not null,
    valor_consulta float not null,
    formadepagamento varchar(25) not null,
    foreign key (ra_paciente) references cadastrarpaciente(ra),
    foreign key (rf_medico) references cadastrarfuncionario(rf),
    foreign key (rf_enfermeiro) references cadastrarfuncionario(rf)
);


-- INSERT

-- INSERT PACIENTES
insert into cadastrarpaciente (ra, nome, rg, cpf, genero,
    endereco, bairro, estado, cidade, cep,
    numero, complemento,
    formadepagamento, email, telefone)
values(
    auto_increment.nextval, 'Lucas Oliveira', 1234567890, 56432122123, 'M',
    'Rua XABC', 'Jardim CCC', 'SP', 'Taboão da serra', 12345678,
    11, 'Complemento',
    'Pix', 'email@email.com', 950735140
);

insert into cadastrarpaciente (ra, nome, rg, cpf, genero,
    endereco, bairro, estado, cidade, cep,
    numero, complemento,
    formadepagamento, email, telefone)
values(
    auto_increment.nextval, 'Ana Silva', 9876543210, 98765432101, 'F',
    'Avenida YZ', 'Centro', 'RJ', 'Rio de Janeiro', 54321098,
    42, 'Apartamento 301',
    'Boleto', 'ana@email.com', 912345678
);

-- INSERT FUNCIONÁRIOS
insert into cadastrarfuncionario (rf, nome, rg, cpf, genero,
    endereco, bairro, estado, cidade, cep,
    numero, complemento,
    formadepagamento, email, telefone,
    formacao, setor, turno,
    salario, cargo)
values(
    auto_increment.nextval, 'Lucas Oliveira Campos', 1234567893, 21432122123, 'M',
    'Rua Xsae', 'Jardim xsa', 'UK', 'Cidade OL', 1234321,
    11, 'Complemento',
    'Pix', 'email@email.com', 950735140,
    'Oftamologista', 'Setor sul', 'Noturno',
    10.000, 'Medico'
);

insert into cadastrarfuncionario (rf, nome, rg, cpf, genero,
    endereco, bairro, estado, cidade, cep,
    numero, complemento,
    formadepagamento, email, telefone,
    formacao, setor, turno,
    salario, cargo)
values(
    auto_increment.nextval, 'Ana Souza Silva', '987654321', '987.654.321-02', 'F',
    'Avenida ABC', 'Centro', 'RJ', 'Rio de Janeiro', '54321',
    '42', 'Apartamento 302',
    'Boleto', 'ana.souza@email.com', '912345679',
    'Enfermeiro', 'Setor Norte', 'Diurno',
    8.000, 'Enfermeiro'
);

-- INSERT CONSULTA/TRIAGEM
insert into consultatriagem (
    id, ra_paciente, tipoconsulta,
    alergias, febre, tosse, fadiga, nausea, vomitos,
    diarreia, calafrios, dorsnasarticulacoes,
    dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal,
    rf_enfermeiro, horario_triagem, data,
    rf_medico, horario_consulta, horario_consulta_inicio, horario_consulta_termino,
    valor_consulta, formadepagamento
)
values (
    auto_increment.nextval, 1, 'Consulta',
    'Não', 'Não', 'Sim', 'Não', 'Sim', 'Não',
    'Não', 'Sim', 'Não',
    'Não', 'Sim', 'Não',
    42, '08:30', TO_DATE('2023-11-14', 'YYYY-MM-DD'),
    41, '10:00', '10:15', '11:00',
    150.00, 'Cartão de Crédito'
);

-- SELECT 

-- PACIENTE
select * from cadastrarpaciente;

-- TRIAGEM
select id, ra_paciente, rf_enfermeiro, horario_triagem, data, alergias, febre, tosse, fadiga, nausea, vomitos, 
    diarreia, calafrios, dorsnasarticulacoes, 
	dificuldaderespiratoria, perdodopaladarouolfato, congestaonasal
from
	consultatriagem;

-- CONSULTA
select id, ra_paciente, rf_medico, tipoconsulta, horario_consulta, horario_consulta_inicio, horario_consulta_termino, valor_consulta, formadepagamento
from consultatriagem;		