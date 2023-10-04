create database escola;

use escola;

create table alunos (
id_aluno integer primary key,
nome_aluno varchar(50),
data_de_nascimento varchar(20),
email varchar(25),
telefone varchar(20),
endereco varchar(25)
);

insert into alunos (id_aluno, nome_aluno, data_de_nascimento, email, telefone, endereco) values
(1, 'Eduardo Vilas Boas', '06-04-2007', 'eduvilasboas@gmail.com', '11-98877-8844', 'av.Parque Queiroz Pacheco' ),
(2, 'Vinicius Guimarães', '06-04-2007', 'viniguimaraes@gmail.com', '11-98799-8984', 'Alameda Rio Negro' ),
(3, 'Cauã da Silva', '03-07-2007', 'cauasilva@gmail.com', '11-98576-8747', 'Rua Bonard' );


create table professor (
id_professor integer primary key,
nome varchar(50),
data_de_contratacao varchar(15)
);

insert into professor(id_professor, nome, data_de_contratacao)values
(1, 'Bruno', '03-15-2022'),
(2, 'Lucas', '04-17-2021'),
(3, 'Fernando', '04-11-2015');

create table turmas (
id_turmas integer primary key,
turma_numero integer,
ano_escolar varchar(15),
id_curso integer,
id_professor integer,
id_aluno integer,
foreign key (id_curso) references cursos(id_cursos),
foreign key (id_professor) references professor(id_professor),
foreign key (id_aluno) references alunos(id_aluno)
);

insert into turmas (id_turmas, turma_numero, ano_escolar) values
(1, 1, '2° A'),
(2, 2, '2° B'),
(3, , '2° A');

create table notas (
id_notas integer primary key,
media_aluno numeric,
id_aluno integer,
id_materia integer,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_materia) references materia(id_materia)
);

create table frequencia (
id_frequencia integer primary key,
frequencia_aluno varchar(50),
id_aluno integer,
id_materia integer,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_materia) references materia(id_materia)
);

create table materia (
id_materia integer primary key,
nome_materia varchar(15),
carga_horaria integer,
id_professor integer,
foreign key (id_professor)
references professor(id_professor)
);

create table cursos (
id_cursos integer primary key,
nome_curso varchar(15),
id_aluno integer,
foreign key (id_aluno)
references alunos(id_aluno)
);

create table matricula (
id_matricula integer primary key,
matricula_aluno varchar(25),
data_de_matricula varchar(15),
id_aluno integer,
id_cursos integer,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_cursos) references cursos(id_cursos)
);

create table atividadesPesquisas (
id_atividade integer primary key,
atividades text,
id_materia integer,
foreign key (id_materia) references materia(id_materia)
);

create table eventos (
id_evento integer primary key,
eventos varchar(50),
id_cursos integer,
foreign key (id_cursos) references cursos(id_cursos)
);

create table parcerias (
id_parcerias integer primary key,
empresas varchar(50),
estagios_projetos varchar(150)
);