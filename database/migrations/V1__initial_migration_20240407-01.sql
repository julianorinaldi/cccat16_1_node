-- database/migration/V1__initial_migration_20240407-01.sql

-- Migration script
CREATE SCHEMA IF NOT EXISTS cccat16;

CREATE TABLE cccat16.account (
    account_id CHAR(36) PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    cpf TEXT NOT NULL,
    car_plate TEXT NULL,
    is_passenger BOOLEAN NOT NULL DEFAULT FALSE,
    is_driver BOOLEAN NOT NULL DEFAULT FALSE
);
