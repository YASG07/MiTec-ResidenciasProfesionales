const { Client } = require('pg')

const conecctionData = {
    user: 'postgres',
    host: 'Servers',
    database: 'MiTec-RP-Psql.sql',
    password: '1234',
    port: 5432,
}
const client = new Client(conecctionData)

client.connect()
client.query('Select * From Alumno')
    .then(response => {
        console.log(response.rows)
        client.end()
    })
    .catch(err => {
        client.end()
    })