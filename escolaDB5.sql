create database escola;

use escola;

create table alunos (
id_aluno integer primary key,
nome_aluno varchar(50) not null,
data_de_nascimento varchar(20) not null,
email varchar(25) not null,
telefone varchar(20) not null,
endereco varchar(25) not null
);

insert into alunos (id_aluno, nome_aluno, data_de_nascimento, email, telefone, endereco) values
(1, 'Eduardo Vilas Boas', '06-04-2007', 'eduvilasboas@gmail.com', '11-98877-8844', 'Av.Parque Queiroz Pacheco' ),
(2, 'Vinicius Guimarães', '12-23-2007', 'viniguimaraes@gmail.com', '11-98799-8984', 'Alameda Rio Negro' ),
(3, 'Cauã da Silva', '07-19-2007', 'cauasilva@gmail.com', '11-98576-8747', 'Rua Bonard' );

select * from alunos;

create table professor (
id_professor integer primary key,
nome varchar(50),
data_de_contratacao varchar(15)
);

insert into professor(id_professor, nome, data_de_contratacao)values
(1, 'Bruno', '03-15-2022'),
(2, 'Lucas', '04-17-2021'),
(3, 'Fernando', '09-11-2015');

select * from professor;

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

insert into turmas (id_turmas, turma_numero, ano_escolar, id_curso, id_professor, id_aluno) values
(1, 1, '1° C', 1, 3, 2),
(2, 2, '2° B', 2, 1, 3),
(3, 3, '3° A', 3, 2, 1);

select * from turmas;

create table notas (
id_notas integer primary key,
media_aluno varchar(20) not null,
id_aluno integer not null,
id_materia integer not null,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_materia) references materia(id_materia)
);

insert into notas (id_notas, media_aluno, id_aluno, id_materia) values
(1, '7.0', 3, 3),
(2, '8.5', 1, 2),
(3, '10', 2, 1);

select * from notas;

create table frequencia (
id_frequencia integer primary key,
frequencia_aluno varchar(50),
id_aluno integer,
id_materia integer,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_materia) references materia(id_materia)
);

insert into frequencia (id_frequencia, frequencia_aluno, id_aluno, id_materia) values
(1, '80%', 2, 1),
(2, '93%', 3, 3),
(3, '77%', 1, 2);

select * from frequencia;

create table materia (
id_materia integer primary key,
nome_materia varchar(15),
carga_horaria varchar(100),
id_professor integer,
foreign key (id_professor)
references professor(id_professor)
);

insert into materia (id_materia, nome_materia, carga_horaria, id_professor) values
(1, 'Matemática', '14', 1),
(2, 'Português', '20', 2),
(3, 'Física', '10', 3);

select * from materia;

create table cursos (
id_cursos integer primary key,
nome_curso varchar(150),
id_aluno integer,
foreign key (id_aluno)
references alunos(id_aluno)
);

insert into cursos (id_cursos, nome_curso, id_aluno) values 
(1, 'Redes de computadores', 2),
(2, 'Desenvolvimento de Sistemas', 1),
(3, 'Eletroeletrônica', 3);

select * from cursos;

create table matricula (
id_matricula integer primary key,
matricula_aluno varchar(25),
data_de_matricula varchar(15),
id_aluno integer,
id_cursos integer,
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_cursos) references cursos(id_cursos)
);

insert into matricula (id_matricula, matricula_aluno, data_de_matricula, id_aluno, id_cursos) values
(1, 158, '05/11/2014', 1, 3),
(2, 217, '02/03/2014', 2, 2),
(3, 129, '10/31/2017', 3, 1);

select * from matricula;

create table atividadesPesquisas (
id_atividade integer primary key,
atividades varchar(150),
id_materia integer,
foreign key (id_materia) references materia(id_materia)
);

insert into atividadesPesquisas (id_atividade, atividades, id_materia) values
(1, 'Pesquisar quem foi Pitágoras e qual foi a sua contribuição para a matemática.', 1),
(2, 'Fazer uma redação com o tema: Novas Tecnologias.', 2),
(3, 'Pesquisar sobre as luas de Júpiter e as características de cada uma.', 3);

select * from atividadesPesquisas;

create table eventos (
id_evento integer primary key,
eventos varchar(150),
id_cursos integer,
foreign key (id_cursos) references cursos(id_cursos)
);

insert into eventos (id_evento, eventos, id_cursos) value
(1, 'Campeonato anual de criação de servidores', 1),
(2, 'Competição de criação de sites', 2),
(3, 'competição de quem cria um circuito mais rápido', 3);

select * from eventos;

create table parcerias (
id_parcerias integer primary key,
empresas varchar(50),
estagios_projetos varchar(150)
);

insert into parcerias (id_parcerias, empresas, estagios_projetos) value
(1, 'Microsoft', 'Desenvolvedor de sistemas'),
(2, 'Oracle', 'Desenvolvedor em nuvem'),
(3, 'Samsung', 'Desenvolvimento do novo Samsung s30 ultra');

select * from parcerias;

-- Esse select serve para ver o desempenho dos alunos como a media final, de qual materia é a nota e o nome do aluno. 
select alunos.nome_aluno, notas.media_aluno, materia.id_materia from alunos join notas on alunos.id_aluno = notas.id_aluno join materia on notas.id_materia = materia.id_materia;

-- Esse select serve para ver a frequencia do aluno bem como o nome dele.
select frequencia.frequencia_aluno, alunos.nome_aluno from frequencia join alunos on frequencia.id_aluno = alunos.id_aluno;

-- Esse select serve para 
select id_evento, eventos, id_cursos from eventos;