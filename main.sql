create sequence auto_increment
    start with 1
    increment by 1
    maxvalue 9999; -- Auto INcrement

create table cadastrapaciente (
    ra int default auto_increment.nextval primary key,
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
 );

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