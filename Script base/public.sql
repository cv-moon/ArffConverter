/*
 Navicat Premium Data Transfer

 Source Server         : postgreslocal
 Source Server Type    : PostgreSQL
 Source Server Version : 160001 (160001)
 Source Host           : localhost:5432
 Source Catalog        : proyecto_mineriadb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160001 (160001)
 File Encoding         : 65001

 Date: 26/01/2024 16:53:34
*/


-- ----------------------------
-- Sequence structure for Carreras_id_carrera_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Carreras_id_carrera_seq";
CREATE SEQUENCE "public"."Carreras_id_carrera_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Estudiantes_id_estudiante_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Estudiantes_id_estudiante_seq";
CREATE SEQUENCE "public"."Estudiantes_id_estudiante_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Generos_id_genero_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Generos_id_genero_seq";
CREATE SEQUENCE "public"."Generos_id_genero_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Matriculas_id_matricula_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Matriculas_id_matricula_seq";
CREATE SEQUENCE "public"."Matriculas_id_matricula_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Modalidades_id_modalidad_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Modalidades_id_modalidad_seq";
CREATE SEQUENCE "public"."Modalidades_id_modalidad_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Periodos_id_periodo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Periodos_id_periodo_seq";
CREATE SEQUENCE "public"."Periodos_id_periodo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for carreras
-- ----------------------------
DROP TABLE IF EXISTS "public"."carreras";
CREATE TABLE "public"."carreras" (
  "id_carrera" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "car_nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for estudiantes
-- ----------------------------
DROP TABLE IF EXISTS "public"."estudiantes";
CREATE TABLE "public"."estudiantes" (
  "id_estudiante" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "nombres" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "apellidos" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "num_identificacion" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "fecha_nacimiento" date NOT NULL,
  "sector_residencia" varchar(200) COLLATE "pg_catalog"."default",
  "telefono_fijo" varchar(100) COLLATE "pg_catalog"."default",
  "telefono_celular" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "email_personal" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "discapacidad" bool NOT NULL,
  "id_genero" int8 NOT NULL
)
;

-- ----------------------------
-- Table structure for generos
-- ----------------------------
DROP TABLE IF EXISTS "public"."generos";
CREATE TABLE "public"."generos" (
  "id_genero" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "gen_nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for matriculas
-- ----------------------------
DROP TABLE IF EXISTS "public"."matriculas";
CREATE TABLE "public"."matriculas" (
  "id_matricula" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "id_estudiante" int8 NOT NULL,
  "id_periodo" int8 NOT NULL,
  "id_carrera" int8 NOT NULL,
  "id_modalidad" int8 NOT NULL,
  "num_matricula" int4 NOT NULL,
  "fecha_inscripcion" date NOT NULL,
  "formalizado" bool NOT NULL,
  "retirado" bool NOT NULL
)
;

-- ----------------------------
-- Table structure for modalidades
-- ----------------------------
DROP TABLE IF EXISTS "public"."modalidades";
CREATE TABLE "public"."modalidades" (
  "id_modalidad" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "mod_nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "descripcion" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for periodos
-- ----------------------------
DROP TABLE IF EXISTS "public"."periodos";
CREATE TABLE "public"."periodos" (
  "id_periodo" int8 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1
),
  "per_nombre" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "fecha_inicio" date,
  "fecha_fin" date
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Carreras_id_carrera_seq"
OWNED BY "public"."carreras"."id_carrera";
SELECT setval('"public"."Carreras_id_carrera_seq"', 11, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Estudiantes_id_estudiante_seq"
OWNED BY "public"."estudiantes"."id_estudiante";
SELECT setval('"public"."Estudiantes_id_estudiante_seq"', 3113, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Generos_id_genero_seq"
OWNED BY "public"."generos"."id_genero";
SELECT setval('"public"."Generos_id_genero_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Matriculas_id_matricula_seq"
OWNED BY "public"."matriculas"."id_matricula";
SELECT setval('"public"."Matriculas_id_matricula_seq"', 3116, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Modalidades_id_modalidad_seq"
OWNED BY "public"."modalidades"."id_modalidad";
SELECT setval('"public"."Modalidades_id_modalidad_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Periodos_id_periodo_seq"
OWNED BY "public"."periodos"."id_periodo";
SELECT setval('"public"."Periodos_id_periodo_seq"', 7, true);

-- ----------------------------
-- Primary Key structure for table carreras
-- ----------------------------
ALTER TABLE "public"."carreras" ADD CONSTRAINT "Carreras_pkey" PRIMARY KEY ("id_carrera");

-- ----------------------------
-- Primary Key structure for table estudiantes
-- ----------------------------
ALTER TABLE "public"."estudiantes" ADD CONSTRAINT "Estudiantes_pkey" PRIMARY KEY ("id_estudiante");

-- ----------------------------
-- Primary Key structure for table generos
-- ----------------------------
ALTER TABLE "public"."generos" ADD CONSTRAINT "Generos_pkey" PRIMARY KEY ("id_genero");

-- ----------------------------
-- Uniques structure for table matriculas
-- ----------------------------
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "num_matricula" UNIQUE ("num_matricula");

-- ----------------------------
-- Primary Key structure for table matriculas
-- ----------------------------
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "Matriculas_pkey" PRIMARY KEY ("id_matricula");

-- ----------------------------
-- Primary Key structure for table modalidades
-- ----------------------------
ALTER TABLE "public"."modalidades" ADD CONSTRAINT "Modalidades_pkey" PRIMARY KEY ("id_modalidad");

-- ----------------------------
-- Primary Key structure for table periodos
-- ----------------------------
ALTER TABLE "public"."periodos" ADD CONSTRAINT "Periodos_pkey" PRIMARY KEY ("id_periodo");

-- ----------------------------
-- Foreign Keys structure for table estudiantes
-- ----------------------------
ALTER TABLE "public"."estudiantes" ADD CONSTRAINT "id_genero" FOREIGN KEY ("id_genero") REFERENCES "public"."generos" ("id_genero") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table matriculas
-- ----------------------------
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "id_carrera" FOREIGN KEY ("id_carrera") REFERENCES "public"."carreras" ("id_carrera") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "id_estudiante" FOREIGN KEY ("id_estudiante") REFERENCES "public"."estudiantes" ("id_estudiante") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "id_modalidad" FOREIGN KEY ("id_modalidad") REFERENCES "public"."modalidades" ("id_modalidad") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."matriculas" ADD CONSTRAINT "id_periodo" FOREIGN KEY ("id_periodo") REFERENCES "public"."periodos" ("id_periodo") ON DELETE NO ACTION ON UPDATE NO ACTION;
