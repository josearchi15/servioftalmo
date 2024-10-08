import sql from "mssql";

const dbSettings = {
    user: "sa",
    password: "jcagdb95",
    server: "localhost",
    database: "SERVIOFTALMO_DRAFT5",
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
}

export const getConnection = async () => {
    try {
        const pool = await sql.connect(dbSettings);
        //const result = await pool.request().query("SELECT GETDATE()")
        //console.log(result.recordsets)
        return pool;
    } catch (error) {
        console.log(error)
    }
}