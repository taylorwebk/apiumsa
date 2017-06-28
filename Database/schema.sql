-- Tablas Principales sin llaves foraneas
create table facultad(
  id integer unsigned not null auto_increment,
  nombre varchar(128),
  mision text,
  vision text,
  primary key(id)
);
create table contenido(
  id integer unsigned not null auto_increment,
  des varchar(128),
  primary key(id)
);
-- Tablas Complementarias sin llaves foraneas
create table correo(
  id integer unsigned not null auto_increment,
  correo varchar(128),
  des varchar(128),
  estado boolean,
  primary key(id)
);
create table telefono(
  id integer unsigned not null auto_increment,
  nro varchar(32),
  des varchar(128),
  estado boolean,
  primary key(id)
);
create table website(
  id integer unsigned not null auto_increment,
  url varchar(128),
  des varchar(128),
  estado boolean,
  primary key(id)
);
create table banco(
  id integer unsigned not null auto_increment,
  nombre varchar(128),
  primary key(id)
);
create table tipo(
  id integer unsigned not null auto_increment,
  tipo varchar(16),
  primary key(id)
);
create table materia(
  id integer unsigned not null auto_increment,
  nombre varchar(128),
  sigla varchar(8),
  primary key(id)
);
create table requisito(
  id integer unsigned not null auto_increment,
  cont varchar(256),
  primary key(id)
);
create table ubicacion(
  id integer unsigned not null auto_increment,
  des varchar(128),
  lat double,
  lon double,
  primary key(id)
);
-- relaciones 1:1
create table dirprefa(
  id integer unsigned not null auto_increment,
  facultad_id integer unsigned not null,
  ubicacion_id integer unsigned not null,
  nombre varchar(128),
  urlImg varchar(128),
  primary key(id),
  foreign key(facultad_id)
  references facultad(id)
  on delete cascade,
  foreign key(ubicacion_id)
  references ubicacion(id)
  on delete cascade
);
-- Relaciones 1:N
create table carrera(
  id integer unsigned not null auto_increment,
  facultad_id integer unsigned not null,
  ubicacion_id integer unsigned not null,
  nombre varchar(128),
  mision text,
  vision text,
  urlImg varchar(128),
  primary key(id),
  foreign key(facultad_id)
  references facultad(id)
  on delete cascade,
  foreign key(ubicacion_id)
  references ubicacion(id)
  on delete cascade
);
create table cursoprefa(
  id integer unsigned not null auto_increment,
  dirprefa_id integer unsigned not null,
  nombre varchar(256),
  detalle varchar(256),
  f date,
  fIniDepo date,
  fFinDepo date,
  fIni date,
  tiempo integer,
  cnac double,
  cext double,
  primary key(id),
  foreign key(dirprefa_id)
  references dirprefa(id)
  on delete cascade
);
create table examendispe(
  id integer unsigned not null auto_increment,
  dirprefa_id integer unsigned not null,
  nombre varchar(256),
  detalle varchar(256),
  f date,
  fIniDepo date,
  fFinDepo date,
  tiempo integer,
  cnac double,
  cext double,
  primary key(id),
  foreign key(dirprefa_id)
  references dirprefa(id)
  on delete cascade
);
-- relaciones N:M
create table banco_examendispe(
  banco_id integer unsigned not null,
  examendispe_id integer unsigned not null,
  primary key(banco_id, examendispe_id),
  foreign key(banco_id)
  references banco(id)
  on delete cascade,
  foreign key(examendispe_id)
  references examendispe(id)
  on delete cascade
);
create table banco_cursoprefa(
  banco_id integer unsigned not null,
  cursoprefa_id integer unsigned not null,
  primary key(banco_id, cursoprefa_id),
  foreign key(banco_id)
  references banco(id)
  on delete cascade,
  foreign key(cursoprefa_id)
  references cursoprefa(id)
  on delete cascade
);
create table contenido_examendispe(
  contenido_id integer unsigned not null,
  examendispe_id integer unsigned not null,
  primary key(contenido_id, examendispe_id),
  foreign key(contenido_id)
  references contenido(id)
  on delete cascade,
  foreign key(examendispe_id)
  references examendispe(id)
  on delete cascade
);
create table contenido_cursoprefa(
  contenido_id integer unsigned not null,
  cursoprefa_id integer unsigned not null,
  primary key(contenido_id, cursoprefa_id),
  foreign key(contenido_id)
  references contenido(id)
  on delete cascade,
  foreign key(cursoprefa_id)
  references cursoprefa(id)
  on delete cascade
);
create table contenido_materia(
  contenido_id integer unsigned not null,
  materia_id integer unsigned not null,
  primary key(contenido_id, materia_id),
  foreign key(contenido_id)
  references contenido(id)
  on delete cascade,
  foreign key(materia_id)
  references materia(id)
  on delete cascade
);
-- REQUISITOS
create table examendispe_requisito(
  requisito_id integer unsigned not null,
  examendispe_id integer unsigned not null,
  primary key(requisito_id, examendispe_id),
  foreign key(requisito_id)
  references requisito(id)
  on delete cascade,
  foreign key(examendispe_id)
  references examendispe(id)
  on delete cascade
);
create table cursoprefa_requisito(
  requisito_id integer unsigned not null,
  cursoprefa_id integer unsigned not null,
  primary key(requisito_id, cursoprefa_id),
  foreign key(requisito_id)
  references requisito(id)
  on delete cascade,
  foreign key(cursoprefa_id)
  references cursoprefa(id)
  on delete cascade
);
create table requisito_tipo(
  requisito_id integer unsigned not null,
  tipo_id integer unsigned not null,
  primary key(requisito_id, tipo_id),
  foreign key(requisito_id)
  references requisito(id)
  on delete cascade,
  foreign key(tipo_id)
  references tipo(id)
  on delete cascade
);
-- CORREOS
create table carrera_correo(
  correo_id integer unsigned not null,
  carrera_id integer unsigned not null,
  primary key(correo_id, carrera_id),
  foreign key(correo_id)
  references correo(id)
  on delete cascade,
  foreign key(carrera_id)
  references carrera(id)
  on delete cascade
);
create table correo_facultad(
  facultad_id integer unsigned not null,
  correo_id integer unsigned not null,
  primary key(facultad_id, correo_id),
  foreign key(facultad_id)
  references facultad(id)
  on delete cascade,
  foreign key(correo_id)
  references correo(id)
  on delete cascade
);
create table correo_dirprefa(
  dirprefa_id integer unsigned not null,
  correo_id integer unsigned not null,
  primary key(dirprefa_id, correo_id),
  foreign key(dirprefa_id)
  references dirprefa(id)
  on delete cascade,
  foreign key(correo_id)
  references correo(id)
  on delete cascade
);
-- TELEFONOS
create table carrera_telefono(
  telefono_id integer unsigned not null,
  carrera_id integer unsigned not null,
  primary key(telefono_id, carrera_id),
  foreign key(telefono_id)
  references telefono(id)
  on delete cascade,
  foreign key(carrera_id)
  references carrera(id)
  on delete cascade
);
create table facultad_telefono(
  facultad_id integer unsigned not null,
  telefono_id integer unsigned not null,
  primary key(facultad_id, telefono_id),
  foreign key(facultad_id)
  references facultad(id)
  on delete cascade,
  foreign key(telefono_id)
  references telefono(id)
  on delete cascade
);
create table dirprefa_telefono(
  dirprefa_id integer unsigned not null,
  telefono_id integer unsigned not null,
  primary key(dirprefa_id, telefono_id),
  foreign key(dirprefa_id)
  references dirprefa(id)
  on delete cascade,
  foreign key(telefono_id)
  references telefono(id)
  on delete cascade
);
-- WEBSITE
create table carrera_website(
  website_id integer unsigned not null,
  carrera_id integer unsigned not null,
  primary key(website_id, carrera_id),
  foreign key(website_id)
  references website(id)
  on delete cascade,
  foreign key(carrera_id)
  references carrera(id)
  on delete cascade
);
create table facultad_website(
  facultad_id integer unsigned not null,
  website_id integer unsigned not null,
  primary key(facultad_id, website_id),
  foreign key(facultad_id)
  references facultad(id)
  on delete cascade,
  foreign key(website_id)
  references website(id)
  on delete cascade
);
create table dirprefa_website(
  dirprefa_id integer unsigned not null,
  website_id integer unsigned not null,
  primary key(dirprefa_id, website_id),
  foreign key(dirprefa_id)
  references dirprefa(id)
  on delete cascade,
  foreign key(website_id)
  references website(id)
  on delete cascade
);
