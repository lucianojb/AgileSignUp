drop table if exists user_roles;
drop table if exists admin_users;
drop table if exists users;
drop table if exists courses;
drop sequence if exists users_userid_seq;
drop sequence if exists courses_courseid_seq;

create sequence users_userid_seq;
create sequence courses_courseid_seq;

CREATE TABLE courses (
	coursedate text NULL,
	numberattendees int4 NULL,
	isavailable bool NULL,
	courseid int4 NOT NULL DEFAULT nextval('courses_courseid_seq'::regclass),
	CONSTRAINT courses_pkey PRIMARY KEY (courseid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE users (
	firstname text NULL,
	lastname text NULL,
	email text NULL,
	federal bool NULL,
	division text NULL,
	courseid int4 NULL,
	userid int8 NOT NULL DEFAULT nextval('users_userid_seq'::regclass),
	preferredcourse int4 NULL,
	CONSTRAINT users_pkey PRIMARY KEY (userid),
	CONSTRAINT users_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.courses(courseid)
)
WITH (
	OIDS=FALSE
);

CREATE table admin_users (
	username varchar(45) NOT NULL,
	password varchar(60) NOT NULL,
	enabled int4 NOT NULL DEFAULT 1,
	CONSTRAINT admin_users_pkey PRIMARY KEY (username)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE user_roles (
	username varchar(45) NOT NULL,
	"role" varchar(45) NOT NULL,
	CONSTRAINT user_roles_pkey PRIMARY KEY (username),
	CONSTRAINT username FOREIGN KEY (username) REFERENCES public.admin_users(username)
)
WITH (
	OIDS=FALSE
);

insert into admin_users values ('agile.admin', '$2a$10$JjHN6x2bBvcbEuCVvg9.5.CuBWdF9qd8nAk5G1kdHR8kpONVH5j4e', 1);

insert into user_roles values ('agile.admin', 'ROLE_ADMIN');