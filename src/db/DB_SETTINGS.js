// *** DB_SETTINGS.js ***
// *** The only place for common database settings ***

const DB_SETTINGS = {
  host: "localhost",
  port: "3308",
  user: "bgf033",
  password: "viFA7u53e",
  database: "bgf033",
  multipleStatements: true,
  debug: true
};

// CommonJS module way works for both
// this is for Node command line script (Node doesn't support export/import by default yet)
module.exports = DB_SETTINGS;
