const mysql = require('mysql');
const fs = require ('fs');
const db_settings = require('./DB_SETTINGS');


console.log(db_settings);
const scripts = ["./Database/SQL_Scripts/00_drop_tables.sql", "./Database/SQL_Scripts/01_create_tables.sql", "./Database/SQL_Scripts/02_insert_technical_test_data.sql"];

//reads the scripts from filepath and concates them into one string
function getQueryFromFile() {
    var query = "";
    for (var i = 0; i < scripts.length; i++) {
        query += fs.readFileSync(scripts[i], "utf8", function (err, data) {
            if (err) throw err;
            return toString(data);
        })
    }
    return query;
}

//create mysql connection ontop of tunnel
async function getConnection (){
    return mysql.createConnection(
        {
            host: db_settings.host,
            port: db_settings.port,
            user: db_settings.user,
            password: db_settings.password,
            database: db_settings.database,
            multipleStatements: db_settings.multipleStatements,
            debug: db_settings.debug,
        }
    )
};

//calls functions and stores return values in a variable
var globalQuery = getQueryFromFile();
var connection = getConnection();

//waits for connection promise to be complete
//then queries remote db with the received client object
connection
.then(client => {
    client.query(globalQuery,
    function(err, results, fields) {
        if (err) throw err;
        console.log("database reset successful!");
        client.end();
    }
  )
})
.catch(err => {
    console.log(err)
});