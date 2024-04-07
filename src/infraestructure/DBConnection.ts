import { Pool } from 'pg';

export default function DBConnection(host: string, user: string = 'app', database: string = 'app', 
                                     password: string = 'app', port: number = 5432) {
    // Configurações de conexão
    const pool = new Pool({
        user: 'app',
        host: host,
        database: 'app',
        password: 'app',
        port: 5432, // Porta padrão do PostgreSQL
    });

    return pool;
}