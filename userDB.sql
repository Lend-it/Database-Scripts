-- -------------------------     << Userlenditdb - V1 >>     -------------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 03/03/2021
-- Autor(es) ..............: Rogério Júnior
-- Banco de Dados .........: PostgreSQL
-- Banco de Dados(nome) ...: userlenditdb
-- 
-- PROJETO => 01 Base de Dados
--         => 01 Tabelas
-- ------------------------------------------------------------------------------------

CREATE DATABASE userLendItDB
    WITH
        ENCODING = UTF8
        LC_COLLATE = 'pt_BR.UTF-8'
        LC_CTYPE = 'pt_BR.UTF-8'
        TEMPLATE = template0;

\c userlenditdb

CREATE TABLE "user" (
    userEmail TEXT NOT NULL,
    name TEXT NOT NULL,
    whatsappNumber TEXT NOT NULL,
    password TEXT NOT NULL,
    latitude NUMERIC NULL,
    longitude NUMERIC NULL,

    CONSTRAINT USER_PK PRIMARY KEY (userEmail),

    CONSTRAINT VALID_EMAIL CHECK (userEmail ~* '^[\w\-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
    CONSTRAINT VALID_COORDINATES CHECK (latitude BETWEEN -90 AND 90 AND longitude BETWEEN -180 AND 180),
    CONSTRAINT VALID_WHATSAPP_NUMBER CHECK (whatsappNumber ~* '^(\d{2})(\d{5}|\d{4})(\d{4})$')
);
