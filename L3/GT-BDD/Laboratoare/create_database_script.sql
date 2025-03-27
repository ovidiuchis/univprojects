	if object_id ('Facultati','U') is  null
		create table Facultati (id int identity(1,1) Primary key, nume nvarchar(20)) 
	if object_id ('Departamente','U') is null
		create table Departamente (id int identity(1,1) Primary key, nume nvarchar(20),id_facultate int , 
		constraint fk_dep foreign key (id_facultate) references Facultati(id) on delete cascade on update cascade ) 
	if object_id ('Catedre','U') is null
		create table Catedre ( id int identity (1,1) primary key, nume nvarchar(20),id_departament int ,
		constraint fk_cat foreign key (id_departament) references Departamente(id) on delete cascade on update cascade ) 
	if object_id ('ProgrameAcademice','U') is null
		create table ProgrameAcademice (id int identity (1,1) primary key, nume nvarchar(20),nivel nvarchar(10))
    if object_id ('TipuriMaterii','U') is null
		create table TipuriMaterii (id int identity(1,1) primary key,name nvarchar(10))
	if object_id ('Materii','U') is null
		create table Materii (id int identity(1,1) primary key,nume nvarchar(50),id_tipmat int,
		constraint fk_tip_mat foreign key (id_tipmat) references TipuriMaterii(id) on delete cascade on update cascade ) 
	if object_id ('Specializari','U') is null
		create table Specializari (id int identity(1,1) primary key, nume nvarchar(20),id_progacademic int, 
		constraint fk_spec foreign key (id_progacademic) references ProgrameAcademice(id) on delete cascade on update cascade ) 
	if object_id ('Curriculumuri','U') is  null
		create table Curriculumuri (semestru int, id_progacademic int, 
		constraint fk_curric foreign key (id_progacademic) references ProgrameAcademice(id) on delete cascade on update cascade,
		constraint pk_curric primary key (semestru,id_progacademic ))
	if object_id ('CurriculumMaterii','U') is null
		create table CurriculumMaterii ( id_materie int,id_progacademic int,semestru int, 
		constraint pk_cc primary key (id_materie,id_progacademic,semestru),
		constraint fk_cc1 foreign key (id_materie) references Materii(id ) on delete cascade on update cascade,
		constraint fk_cc2 foreign key (id_progacademic) references ProgrameAcademice(id) on delete cascade on update cascade)
	if object_id ('Syllabusuri','U') is null
		create table Syllabusuri (id int identity(1,1) primary key, continut nvarchar(50),id_materie int , 
		constraint fk_syll foreign key (id_materie) references Materii(id) on delete cascade on update cascade)
	if object_id ('Useri','U') is null 
		create table Useri (id int identity(1,1) primary key, username nvarchar(20), parola nvarchar(20), grup nvarchar(20))
	if object_id ('Profesori','U') is null
		create table Profesori (id int identity(1,1) primary key, nume nvarchar(30),id_catedra int,id_username int,
		constraint fk_prof1 foreign key (id_catedra) references Catedre(id) on delete cascade on update cascade,
		constraint fk_prof2 foreign key (id_username) references Useri (id) on delete cascade on update cascade)
	if object_id ('ProfMaterii','U') is null
		create table ProfMaterii (id_prof int, id_materie int,
		constraint fk_pc1 foreign key (id_prof) references Profesori(id) on delete cascade on update cascade,
		constraint fk_pc2 foreign key (id_materie) references Materii (id)  on delete cascade on update cascade,
		constraint pk_pc primary key (id_prof,id_materie)	)
	if object_id ('GrupuriSpecializari','U') is null
		create table GrupuriSpecializari (id int identity(1,1) primary key,id_specializare int, nume nvarchar(20),
		constraint fk_grups foreign key (id_specializare) references Specializari(id)  on delete cascade on update cascade)
	if object_id ('Studenti','U') is null
		create table Studenti (id int identity(1,1) primary key ,nume nvarchar(30),id_grupuriSpec int,id_user int,grupa int,
		constraint fk_stud1 foreign key (id_user) references Useri(id) on delete cascade on update cascade,
		constraint fk_stud2 foreign key (id_grupuriSpec) references GrupuriSpecializari(id) on delete cascade on update cascade)
	if object_id ('Teste','U') is null
		create table Teste (id int identity(1,1) primary key,id_materie int ,
		constraint fk_teste foreign key (id_materie) references Materii(id) on delete cascade on update cascade)
	if object_id ('Cursuri','U') is null
		create table Cursuri (id int identity(1,1) primary key , bibliografie nvarchar(50),orar datetime,id_materie int ,
		constraint fk_curs foreign key (id_materie) references Materii (id)  on delete cascade on update cascade)
	if object_id ('Intrebari','U') is null
		create table Intrebari (id int identity(1,1) primary key, descriere nvarchar(50), id_curs int,
		constraint fk_int foreign key (id_curs) references Cursuri (id) on delete cascade on update cascade)
	if object_id ('Raspunsuri','U') is null
		create table Raspunsuri (id int identity(1,1) primary key, descriere nvarchar(50), corect smallint, id_intrebare int ,
		constraint fk_rasp foreign key (id_intrebare) references Intrebari (id) on delete cascade on update cascade)
	if object_id ('IntrebariTeste','U') is null
		create table IntrebariTeste (id_test int,id_intrebare int,
		constraint pk_it primary key (id_test,id_intrebare),
		constraint fk_it1 foreign key (id_test) references Teste(id) ,
		constraint fk_it2 foreign key (id_intrebare) references Intrebari(id))
	if object_id ('EvaluariTeste','U') is null
		create table EvaluariTeste (id_student int , id_test int ,comments nvarchar(30), nota float,
		constraint pk_evalt primary key (id_student,id_test),
		constraint fk_et1 foreign key (id_test) references Teste(id) ,
		constraint fk_et2 foreign key (id_student) references Studenti(id))
	if object_id ('Homeworks','U') is null
		create table Homeworks (id int identity(1,1) primary key, path_atasament nvarchar(30) not null, descriere nvarchar(20), id_curs int,
		constraint fk_hw foreign key (id_curs) references Cursuri(id) on delete cascade on update cascade)
	if object_id ('EvaluariHomework','U') is null
		create table EvaluariHomework ( id_student int, id_homework int, nota float , comments nvarchar(20), path_atasament nvarchar(20),
		constraint fk_eh1 foreign key (id_student) references Studenti (id),
		constraint fk_eh2 foreign key (id_homework) references Homeworks(id),
		constraint pk_eh primary key (id_student, id_homework) )
	if object_id ('Catalog','U') is null
		create table Catalog (id_student int, id_materie int, id_specializare int, nota_examen float, nota_partial float, nota_homework float, nota_test float, nota float,
		constraint pk_catalog primary key (id_student,id_materie, id_specializare),
		constraint fk_cat1 foreign key (id_student) references Studenti(id) ,
		constraint fk_cat2 foreign key (id_materie) references Materii (id) ,
		constraint fk_cat3 foreign key (id_specializare) references Specializari (id) on update cascade)
	
	