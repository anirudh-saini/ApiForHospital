const mysql = require("mysql2");
const { HOST, DBPORT, DBUSER, PASSWORD, DBNAME } = process.env;

const conn = mysql.createPool({
	connectionLimit: 4,
	host: HOST,
	port: DBPORT,
	user: DBUSER,
	password: PASSWORD,
	database: DBNAME,
});

conn.getConnection((err, connection) => {
	if (err) throw err;
	console.log("Database connected successfully");
	connection.release();
});

module.exports = conn;
