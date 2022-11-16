CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" integer,
  "gender" varchar,
  "roles_id" uuid,
  "memberships_id" uuid
);

CREATE TABLE "user_courses" (
  "id" serial PRIMARY KEY,
  "user_id" uuid,
  "courses_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "duration" integer,
  "level" varchar,
  "teacher" varchar,
  "videos_id" uuid,
  "categories_id" uuid
);


CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "memberships" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "price" money,
  "duration" integer,
  "description" text
);

ALTER TABLE "users" ADD FOREIGN KEY ("memberships_id") REFERENCES "memberships" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("videos_id") REFERENCES "course_video" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

--CRUD
--C create insert into
--R read select 
--U update  update 
--D delete delete

insert into users (
    id, 
    first_name, 
    last_name, 
	email, 
	"password", 
	age, 
	gender
) values (
	'50f8f6cd-d908-4c60-ab3b-7dcef26a2ddf', 
	'Santigo', 
	'Cardona Garzon', 
	'santicard@hotmail.com', 
	'123456', 
	27, 
	'male'
);

insert into categories (
	id,
	name
) values (
	'bec5bf43-e483-41ab-8ad0-b0a834067635',
	'Finanzas e Inversiones'
);

insert into categories (
	id,
	name
) values (
	'67c5f08f-84ad-40ff-9368-05b2af34ecf3',
	'Negocios'
);

insert into categories (
	id,
	name
) values (
	'f77b3d33-22fa-41f1-84ac-33d38de88863',
	'Diseño'
);

insert into categories (
	id,
	name
) values (
	'3b875f70-54fc-4e7e-8d32-43362065aefb',
	'Data Science e Inteligencia Artificial'
);

insert into course_video (
	id,
	title,
	url
) values (
	'c1407f1b-68b2-43b8-86cd-de8cf6c6acf6',
	'¿Por que aprender Python?',
	'https://www.youtube.com/watch?v=DLikpfc64cA'
);

insert into course_video (
	id,
	title,
	url
) values (
	'5c553bcb-873e-419c-9e1b-597c882c1101',
	'Booleans',
	'https://www.youtube.com/watch?v=9OK32jb_TdI'
);

insert into courses (
	id,
	title,
	description,
	duration,
	level,
	teacher,
	videos_id
) 	values (
	'cd63ee8a-225d-4b0b-bbeb-4a3600efcfa7',
	'Curso de Fundamentos de Python',
	'Aprende Python desde cero. Eleva tus oportunidades 
	con este lenguaje en gran crecimiento para áreas como 
	data science, desarrollo backend, inteligencia artificial, IoT y 
	más. Crea tus primeros programas utilizando variables, 
	estructuras de datos, condicionales y ciclos.',
	12,
	'beginner',
	'Agusto Olivero',
	'5c553bcb-873e-419c-9e1b-597c882c1101'
);

insert into courses (
	id,
	title,
	description,
	duration,
	level,
	teacher,
	videos_id
) 	values (
	'b287bc71-6b6d-4abb-a93b-6d01e5b2eba5',
	'Curso Práctico de Storage en AWS',
	'Conoce cómo iniciar una carrera en data science e 
	inteligencia artificial entendiendo cómo funciona esta área de la 
	tecnología, qué oportunidades tiene y qué caminos seguir para 
	conseguir tu primer trabajo en datos.',
	16,
	'advanced',
	'Carlos Andres Zambrano',
	'5c553bcb-873e-419c-9e1b-597c882c1101'
);

insert into memberships (
	id,
	name,
	price,
	duration,
	description
) values (
	'ac5f23fd-79a0-41c3-88b0-bfbb1906cb73',
	'Standard',
	'12,99',
	'1',
	'This memberships have a month duration and you can saw all courses'
);

insert into memberships (
	id,
	name,
	price,
	duration,
	description
) values (
	'77f02138-ad75-4498-9361-e615046cb1c7',
	'Premium',
	'190',
	'12',
	'This memberships have twelve month duration and you can saw all courses'
);

insert  into roles (
	id,
	name
) values (
	'e6028e76-9784-4155-9c11-fbd2cc4b14de',
	'Student'
);

insert  into roles (
	id,
	name
) values (
	'7a07c5e1-0754-47ed-8842-8befdc48b260',
	'Teacher'
);

insert  into roles (
	id,
	name
) values (
	'c4cd56a7-4c1e-452b-8251-8b8ea147b653',
	'Admin'
);

insert into user_courses (
	user_id,
	courses_id
) values (
	'50f8f6cd-d908-4c60-ab3b-7dcef26a2ddf',
	'cd63ee8a-225d-4b0b-bbeb-4a3600efcfa7'
);

insert into user_courses (
	user_id,
	courses_id
) values (
	'7a02f243-a8d6-458d-ab20-0bc3ae2fca52',
	'b287bc71-6b6d-4abb-a93b-6d01e5b2eba5'
);