var db = require('../db');

module.exports = {
  messages: {
    get: function () {
      db.query('SELECT text FROM messages', (err, outcome) => {
      
        if(err) throw err;
        
        console.log('Outcome:', outcome);
      });
    }, // a function which produces all the messages
    // sql = INSERT INTO messages(text, room, name) FROM (messages.text, messages.username ,messages.roomName)
    post: function (message) {
      db.query(`INSERT INTO Messages (id, user, Text, timestamp) 
                VALUES (null, ${message.username}, ${message.message}, ${Date.now()});`, 
                (err, outcome) => {
        if (err) throw err;
      });

    } // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function () {
      db.query('SELECT id_Users, user FROM Messages', (err, outcome) => {
        if(err) throw err;
        
        console.log('Outcome:', outcome);
      });
    },
    post: function () {
      db.query(`INSERT INTO Users (id) 
      VALUES (null);`, 
      (err, outcome) => {
        if (err) throw err;
      });
    }
  }
};

