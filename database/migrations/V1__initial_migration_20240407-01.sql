-- database/migration/V1__initial_migration_20240407-01.sql

-- Migration script

-- Verificar se o esquema existe antes de removê-lo
DO $$BEGIN
    IF EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = 'cccat16') THEN
        EXECUTE 'DROP SCHEMA cccat16 CASCADE';
    END IF;
END$$;

-- Criar o esquema
CREATE SCHEMA cccat16;

-- Verificar se a tabela já existe antes de criá-la
DO $$BEGIN
    IF NOT EXISTS (SELECT table_name FROM information_schema.tables WHERE table_schema = 'cccat16' AND table_name = 'account') THEN
        CREATE TABLE cccat16.account (
            account_id UUID PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            cpf TEXT NOT NULL,
            car_plate TEXT NULL,
            is_passenger BOOLEAN NOT NULL DEFAULT FALSE,
            is_driver BOOLEAN NOT NULL DEFAULT FALSE
        );
    END IF;
END$$;
