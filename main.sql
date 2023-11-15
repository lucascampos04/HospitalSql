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
    data_nascimento date not null,
);

select * from cadastrarfuncionario;

alter table cadastrarfuncionario 
    drop column endereco; 


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
create table consultatriagem (
    id int primary key,
    ra_paciente int not null,
    tipoconsulta varchar(15) not null,
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
    rf_enfermeiro int not null,
    horario_triagem char(5) not null,
    data date not null,
    rf_medico int not null,
    horario_consulta char(5) not null,
    horario_consulta_inicio char(5) not null,
    horario_consulta_termino char(5) not null,
    valor_consulta float not null,
    formadepagamento varchar(25) not null,
    nivelurgencia varchar(15),
    sintomas_especificos varchar(25),
    condicoes_pre_existentes varchar(25),
    medicacoes varchar(25),
    observacoes_adicionais varchar(50),
    foreign key (ra_paciente) references cadastrarpaciente(ra),
    foreign key (rf_medico) references cadastrarfuncionario(rf),
    foreign key (rf_enfermeiro) references cadastrarfuncionario(rf)
);

-- Obitos
create table obitos(
    id int primary key,
    causaDaMorte varchar(40) not null,
    id_consultaOrTriagem int not null,
    horaDoObito char(5) not null,
    data date
    foreign key (id_consultaOrTriagem) references consultatriagem(id)
);
