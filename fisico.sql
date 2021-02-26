-- -----------------------------     << DB - V1 >>     -----------------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 26/02/2021
-- Autor(es) ..............: Rogério Júnior e Thiago Mesquita
-- Banco de Dados .........: PostgreSQL
-- Banco de Dados(nome) ...: DB
-- 
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
-- ------------------------------------------------------------------------------------

CREATE DATABASE DB
    WITH
        ENCODING = UTF8
        LC_COLLATE = 'pt_BR.UTF-8'
        LC_CTYPE = 'pt_BR.UTF-8'
        TEMPLATE = template0;

\c db

CREATE TABLE "user" (
    userEmail TEXT NOT NULL,
    name TEXT NOT NULL,
    whatsappNumber NUMERIC NOT NULL,
    password TEXT NOT NULL,
    latitude NUMERIC NULL,
    longitude NUMERIC NULL,

    CONSTRAINT USER_PK PRIMARY KEY (userEmail)
);

CREATE TABLE RATE (
    rateId UUID NOT NULL,
    stars REAL NOT NULL,
    review TEXT NOT NULL,
    repport BOOLEAN NULL,
    reviewed TEXT NOT NULL,
    reviewer TEXT NOT NULL,

    CONSTRAINT RATE_PK PRIMARY KEY (rateId),

    CONSTRAINT RATE_USER_REVIEWED_FK FOREIGN KEY (reviewed)
        REFERENCES "user" (userEmail)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT RATE_USER_REVIEWER_FK FOREIGN KEY (reviewer)
        REFERENCES "user" (userEmail)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PRODUCT_CATEGORY (
    productCategoryId SMALLSERIAL NOT NULL,
    name TEXT NOT NULL,

    CONSTRAINT PRODUCT_CATEGORY_PK PRIMARY KEY (productCategoryId)
);

CREATE TABLE REQUEST (
    requestId UUID NOT NULL,
    productName TEXT NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    description TEXT NOT NULL,
    requester TEXT NOT NULL,
    lender TEXT NOT NULL,
    productCategoryId SMALLSERIAL NOT NULL,

    CONSTRAINT REQUEST_PK PRIMARY KEY (requestId),

    CONSTRAINT REQUEST_PRODUCT_CATEGORY_FK FOREIGN KEY (productCategoryId)
        REFERENCES PRODUCT_CATEGORY (productCategoryId)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT REQUEST_USER_LENDER_FK FOREIGN KEY (lender)
        REFERENCES "user" (userEmail)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT REQUEST_USER_REQUESTER_FK FOREIGN KEY (requester)
        REFERENCES "user" (userEmail)
        ON DELETE CASCADE
        ON UPDATE CASCADE   
);
