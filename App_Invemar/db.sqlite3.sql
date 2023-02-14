BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "modelos_especie" (
	"id"	integer NOT NULL,
	"nombreComun"	varchar(50) NOT NULL,
	"nombreCientifico"	varchar(50) NOT NULL,
	"reino"	varchar(50) NOT NULL,
	"filo"	varchar(50) NOT NULL,
	"clase"	varchar(50) NOT NULL,
	"orden"	varchar(50) NOT NULL,
	"familia"	varchar(50) NOT NULL,
	"genero"	varchar(50) NOT NULL,
	"especie"	varchar(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "modelos_lugar" (
	"id"	integer NOT NULL,
	"pais"	varchar(50) NOT NULL,
	"departamento"	varchar(50) NOT NULL,
	"ciudad"	varchar(50) NOT NULL,
	"lugar"	varchar(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "modelos_avistamiento" (
	"id"	integer NOT NULL,
	"especie_id"	bigint NOT NULL,
	"lugar_id"	bigint NOT NULL,
	"latitud"	varchar(50) NOT NULL,
	"longitud"	varchar(50) NOT NULL,
	"autor"	varchar(50) NOT NULL,
	"notas"	varchar(200) NOT NULL,
	FOREIGN KEY("lugar_id") REFERENCES "modelos_lugar"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("especie_id") REFERENCES "modelos_especie"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-03-23 17:31:20.283156');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-03-23 17:31:20.531658');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-03-23 17:31:20.688067');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-03-23 17:31:20.756498');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-03-23 17:31:20.842530');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2022-03-23 17:31:20.960820');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2022-03-23 17:31:21.064447');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2022-03-23 17:31:21.133857');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2022-03-23 17:31:21.181804');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2022-03-23 17:31:21.254365');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2022-03-23 17:31:21.329980');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2022-03-23 17:31:21.397430');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2022-03-23 17:31:21.462933');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2022-03-23 17:31:21.578659');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2022-03-23 17:31:21.707955');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2022-03-23 17:31:21.778330');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2022-03-23 17:31:21.910306');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2022-03-23 17:31:22.013205');
INSERT INTO "django_migrations" VALUES (19,'modelos','0001_initial','2022-03-23 21:47:13.535896');
INSERT INTO "django_migrations" VALUES (20,'modelos','0002_alter_avistamiento_especie_alter_avistamiento_lugar_and_more','2022-03-23 21:53:03.914401');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'modelos','avistamiento');
INSERT INTO "django_content_type" VALUES (8,'modelos','especie');
INSERT INTO "django_content_type" VALUES (9,'modelos','lugar');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_avistamiento','Can add avistamiento');
INSERT INTO "auth_permission" VALUES (26,7,'change_avistamiento','Can change avistamiento');
INSERT INTO "auth_permission" VALUES (27,7,'delete_avistamiento','Can delete avistamiento');
INSERT INTO "auth_permission" VALUES (28,7,'view_avistamiento','Can view avistamiento');
INSERT INTO "auth_permission" VALUES (29,8,'add_especie','Can add especie');
INSERT INTO "auth_permission" VALUES (30,8,'change_especie','Can change especie');
INSERT INTO "auth_permission" VALUES (31,8,'delete_especie','Can delete especie');
INSERT INTO "auth_permission" VALUES (32,8,'view_especie','Can view especie');
INSERT INTO "auth_permission" VALUES (33,9,'add_lugar','Can add lugar');
INSERT INTO "auth_permission" VALUES (34,9,'change_lugar','Can change lugar');
INSERT INTO "auth_permission" VALUES (35,9,'delete_lugar','Can delete lugar');
INSERT INTO "auth_permission" VALUES (36,9,'view_lugar','Can view lugar');
INSERT INTO "modelos_especie" VALUES (1,'NombreComunComun','Cientificococ','kvsmklmfves','lvmsñlm,vgñs','lñmñlmñlñ','mñklmññhvb','lkjbkb','kbkvbkbjbkj','kjbkjb');
INSERT INTO "modelos_especie" VALUES (2,'Nombre','comun','animal','filofilo','kasndmkamdmaw','Orden','familia','genero','especie');
INSERT INTO "modelos_especie" VALUES (3,'pajaro','Pajarus martillus','Animal','Mmomo','Aves','primario','Aves','Volador','Aviar');
INSERT INTO "modelos_lugar" VALUES (1,'Colombia','Magdalena','SantaMarta','Barrio Nuevo');
INSERT INTO "modelos_lugar" VALUES (2,'Colombia','Magdalena','SantaMarta','BarrioBarrio');
INSERT INTO "modelos_lugar" VALUES (3,'Colombia','Magdalena','Pueblo Viejo','Plaza Central 2');
INSERT INTO "modelos_lugar" VALUES (4,'España','Madrid','Madrid','Parque centenario');
INSERT INTO "modelos_avistamiento" VALUES (1,1,4,'64151','5316354651','Brian','muchas notas');
INSERT INTO "modelos_avistamiento" VALUES (2,3,4,'64151','5316354651','Brian Alvarez','Notas notas notas');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "modelos_avistamiento_especie_id_c2b08ebb" ON "modelos_avistamiento" (
	"especie_id"
);
CREATE INDEX IF NOT EXISTS "modelos_avistamiento_lugar_id_d14287b7" ON "modelos_avistamiento" (
	"lugar_id"
);
COMMIT;
