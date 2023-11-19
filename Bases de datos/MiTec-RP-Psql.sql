/*Crea la tabla Alumno con la llave primaria NoControl
  Proyecto_IDProyecto y Asesor_Clave como llaves foraneas*/
Create Table Alumno (
	NoControl varchar(8) not null,
	Alumno_Nombres varchar(90) not null,
	Alumno_ApellidoP varchar(45) not null,
	Alumno_ApellidoM varchar(45) not null,
	Carrera varchar(45) not null,
	Correo varchar(45) not null,
	Semestre int not null,
	NIP varchar(20) not null,
	Proyecto_IDProyecto integer,
	Asesor_Clave varchar(18),
	primary key (NoControl)
);

/*Crea la tabla Asesor con la llave primaria Clave
  no contiene llaves foraneas*/
Create Table Asesor (
	Clave varchar(18) not null,
	Asesor_Nombres varchar(90) not null,
	Asesor_ApellidoP varchar(45) not null,
	Asesor_ApellidoM varchar (45) not null,
	Academia varchar(45) not null,
	Correo varchar(45) not null,
	NIP varchar(20) not null,
	primary key (Clave)
);

/*Crea la tabla Documento con la llave primaria Numero
  Proyecto_IDProyecto y Alumno_NoControl como llaves foraneas*/
Create Table Documento (
	Numero integer not null,
	Formato varchar(45) not null,
	Estado varchar(45),
	FechaEntrega date,
	Proyecto_IDProyecto integer,
	Alumno_NoControl varchar(8),
	primary key (Numero)
);

/*Crea la tabla Empresa con la llave primaria RazonSocial
  No contiene llaves foraneas*/
Create Table Empresa (
	RazonSocial varchar(50) not null,
	Empresa_Nombre varchar(45) not null,
	Ramo varchar(45) not null,
	Domicilio varchar(45) not null,
	Representante varchar(90) not null,
	Email varchar(45),
	Telefono varchar(10),
	primary key (RazonSocial)
);

/*Crea la tabla Proyecto con la llave primaria IDProyecto
  Empresa_RazonSocial como llaves foraneas*/
Create Table Proyecto (
	IDProyecto integer not null,
	Proyecto_Nombre varchar(45),
	FechaFinal date not null,
	Empresa_RazonSocial varchar(50) not null,
	primary key (IDProyecto)
);

/*Añade la restriccón de llave foranea al campo Proyecto_IDProyecto en la tabla Alumno
  apuntando al campo IDProyecto de la tabla Proyecto*/
Alter Table Alumno Add constraint Proyecto_IDProyecto_FK foreign key (Proyecto_IDProyecto) references
Proyecto(IDProyecto);
/*Añade la restriccón de llave foranea al campo Asesor_Clave en la tabla Alumno
  apuntando al campo Clave de la tabla Asesor*/
Alter Table Alumno Add constraint Asesor_Clave_FK foreign key (Asesor_Clave) references Asesor(Clave);
/*Añade la restriccón de llave foranea al campo Alumno_NoControl en la tabla Documento
  apuntando al campo NoControl de la tabla Alumno*/
Alter Table Documento Add constraint Alumno_NoControl_FK foreign key (Alumno_NoControl) references
Alumno(NoControl);
/*Añade la restriccón de llave foranea al campo Proyecto_IDProyecto en la tabla Documento
  apuntando al campo IDProyecto de la tabla Proyecto*/
Alter Table Documento Add constraint Proyecto_IDProyecto_FK foreign key (Proyecto_IDProyecto) references
Proyecto(IDProyecto);
/*Añade la restriccón de llave foranea al campo Empresa_RazonSocial en la tabla Proyecto
  apuntando al campo RazonSocial de la tabla Empresa*/
Alter Table Proyecto Add constraint Empresa_RazonSocial_FK foreign key (Empresa_RazonSocial) references
Empresa(RazonSocial);