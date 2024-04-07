import DBConnection from "../../src/infraestructure/DBConnection";

test("Deve fazer uma conexão com banco de dados", async () => {
    var result : string = ""
    const testOK = "OK"
    var pool = DBConnection('localhost');
    pool.query('SELECT NOW()', async (err: any, res: { rows: any[]; }) => {

        if (err) {
            //console.log('Erro ao executar consulta:', err);
            result = "NOK";
        } else {
            //console.log('Consulta bem-sucedida. Resultado:', res.rows[0]);
            result = "OK";
        }
        await pool.end();
        expect(result).toBe(testOK);
    });
});