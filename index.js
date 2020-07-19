const mongodb = require('mongodb');
const Joi = require('joi');
const express = require('express');
const bcrypt = require('bcrypt');

const app = express();
app.use(express.json()); 

// global variables for mongo DB
var MongoClient = mongodb.MongoClient;
var url = "mongodb://localhost:27017/";
const g_mongodb_name = "LongDB";
const g_collection_users = "customers";
const g_collection_rooms = "rooms";
//var g_collection_roomsTxnLog = "roomsTxnLog";

/////////////////////////////////////////////////////////
app.get('/', (req, res) => {

  res.send('Welcome to free chat! Have fun!');

});

/////////////////////////////////////////////////////////
// Get all customers
////////////////////////////////////////////////////////
app.get('/customers', (req, res) => {

try {
   MongoClient.connect(url, function(err, db) {
     if (err) throw err;
     var dbo = db.db(g_mongodb_name);

     dbo.collection(g_collection_users).find().toArray(function(err, result) {
         if (err) throw err;
         res.send(result);
     });

     db.connect(); 
   });
  }
  catch {
    res.status(500).send('internal error');
  }
});


/////////////////////////////////////////////////////////
// Get one customer's info by account_name
/////////////////////////////////////////////////////////
app.get('/customers/:account_name', (req, res) => {

try {
   MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db(g_mongodb_name);
      
      var query = { account_name: req.params.account_name };
      dbo.collection(g_collection_users).find(query).toArray(function(err, result) {
          if (err) throw err;

          if (result.length < 1) {
            res.status(404).send('The customer is not found');
            return;
          }

          res.send(result);
      });
 
      db.close(); 
    });
  }
  catch {
    res.status(500).send('internal error');
  }

});


/////////////////////////////////////////
// post API
/////////////////////////////////////////
app.post('/customers/signup', async (req, res) => {

  try {
   //const check = validateCustomer(req.body); 
   //if (check.error) {
   //   res.status(400).send(check.error.details[0].message);
   //   return; 
  // }

   // encrypt the password 
   const hashedPassword = await bcrypt.hash(req.body.password, 10);

   const customer = {
      account_name: req.body.account_name,
      last_name: req.body.last_name,
      first_name: req.body.first_name,
      password: hashedPassword
    }

   console.log('POST /customers/signup, new user signup');

   // add to mongoDB
   MongoClient.connect(url, //{poolSize: 10, bufferMaxEntries: 0, useNewUrlParser: true,useUnifiedTopology: true}, 
     function(err, db) {
      if (err) throw err;
      var dbo = db.db(g_mongodb_name);
      
      var query = { account_name: req.body.account_name };
      db.db(g_mongodb_name).collection(g_collection_users).find(query).toArray(function(err, result) {
        if (err) throw err; 

        if (result.length >0 ) {
            res.status(404).send('user account already exist');
        }
        else { 
            // insert new customer 
            MongoClient.connect(url, function(err, db2) { 
                db2.db(g_mongodb_name).collection(g_collection_users).insertOne(customer, function(err, ins) {
                  if (err) throw err;
                });

                db2.close();
            });

            res.status(200).send('success');
        }
      
      });     
      
      db.close(); 
    });

  }
  catch {
    // return exception 
    res.status(500).send();
  }

});


/////////////////////////////////////////
// post API
/////////////////////////////////////////
app.post('/customers/login', async (req, res) => {

try {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;

  console.log(req.body);

    var query = { account_name: req.body.account_name }; 
    db.db(g_mongodb_name).collection(g_collection_users).find(query).toArray(function(err, result) {
        if (err) throw err;

        if (result.length <1) {
          res.status(404).send('The customer account is not found');
          return;   
        }
        
        //console.log(bcrypt.compare(req.body.password, result[0].password));

        // compare password
        if (bcrypt.compareSync(req.body.password, result[0].password) == true) {
            res.status(200).send('Login success');
        }
        else {
           res.status(404).send('Invalid password');
        }

    });

    db.close(); 
  });

}
catch {
     // exception
     res.status(500).send();
  }

});
  
///////////////////////////////////////////
//  put API: for update
///////////////////////////////////////////
app.put('/customers/:account_name', (req, res) => {
 
   // check input 
   const result = validateCustomer(req.body); 
   if (result.error) {
      res.status(400).send(result.error.details[0].message);
      return; 
   }

   var myquery = { account_name: req.params.account_name };
   var newvalues = { $set: {last_name: req.body.last_name, first_name: req.body.first_name } };

    // First check if user exists
    MongoClient.connect(url, function(err, db) {
      if (err) {
        console.log(err);
        throw err;
      }
      var dbo = db.db(g_mongodb_name);
      var query = { account_name: req.params.account_name };
      dbo.collection(g_collection_users).find(query).toArray(function(err, result) {
       if (err) {
         console.log(err);
         throw err;
       }
       
       if (result.length < 1) {
         res.status(404).send('The customer is not found');
         return; 
       }

       // update customer 
       dbo.collection(g_collection_users).updateOne(myquery, newvalues, function(err, upd) {
         if (err) throw err;
       });
 
       res.send('success');
       db.close();
   });
 });
});


/////////////////////////////////////////////////
// GET: return all rooms
/////////////////////////////////////////////////
app.get('/rooms', (req, res) => {

  try {
     MongoClient.connect(url, function(err, db) {
       if (err) throw err;
       var dbo = db.db(g_mongodb_name);
  
       dbo.collection(g_collection_rooms).find().toArray(function(err, result) {
           if (err) throw err;
           res.send(result);
       });
  
       db.connect(); 
     });
    }
    catch {
      res.status(500).send('internal error');
    }
  });
  
  
  /////////////////////////////////////////////////////////
  // Get one room's info by room_name
  /////////////////////////////////////////////////////////
  app.get('/rooms/:room_name', (req, res) => {
  
  try {
     MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db(g_mongodb_name);
        
        var query = { room_name: req.params.room_name };
        dbo.collection(g_collection_rooms).find(query).toArray(function(err, result) {
            if (err) throw err;
  
            if (result.length < 1) {
              res.status(404).send('The room is not found');
              return;
            }
  
            res.send(result);
        });
   
        db.close(); 
      });
    }
    catch {
      res.status(500).send('internal error');
    }
  
  });

/////////////////////////////////////////
// post API
/////////////////////////////////////////
app.post('/rooms/create', (req, res) => {

  try {
   const check = validateRoom(req.body); 
   if (check.error) {
      res.status(400).send(check.error.details[0].message);
      return; 
   }

   console.log('POST /rooms/create');
    //console.log(req.body); 
    
   const room = {
    room_name: req.body.room_name,
    parent: req.body.parent,
    title:  req.body.title,
    description: req.body.description,
    owner: req.body.owner,
    tags: req.body.tags, 
    color:  req.body.color, 
    num_speaker: 0,
    num_listener: 0
   }

    // add to mongoDB
    MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db(g_mongodb_name);
      
      var query = { room_name: req.body.room_name };
      db.db(g_mongodb_name).collection(g_collection_rooms).find(query).toArray(function(err, result) {
        if (err) throw err; 

        if (result.length >0 ) {
            res.status(200).send('Room already exist');
        }
        else { 
            // insert new customer 
            MongoClient.connect(url, function(err, db2) { 
                db2.db(g_mongodb_name).collection(g_collection_rooms).insertOne(room, function(err, ins) {
                  if (err) throw err;
                });

                db2.close();
            });

            res.status(201).send('success');
        }
      
      });     
      
      db.close(); 
    });

  }
  catch {
    // return exception 
    res.status(500).send();
  }

});


/////////////////////////////////////////
// post API: one user enters a room
/////////////////////////////////////////
app.put('/rooms/join', (req, res) => {

try {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db(g_mongodb_name);
    var query = { room_name: req.body.room_name }; 
    dbo.collection(g_collection_rooms).find(query).toArray(function(err, result) {
        if (err) throw err;

        if (result.length <1) {
          res.status(404).send('The room is not found');
          return;   
        }

        res.status(200).send(result[0]); 

        // update num_speaker/num_listener count 
        var delta_speaker  = 0;
        var delta_listener = 0; 
        if (req.body.activity == 'S')
           delta_speaker = 1;
        if (req.body.activity == 'L')
           delta_listener = 1;
        
           // update num_speaker/num_listener counter 
        if (delta_speaker + delta_listener > 0) 
        {
          var myquery = { room_name: req.body.room_name };
          var newvalues = { $set: {num_speaker: result[0].num_speaker + delta_speaker, 
                                   num_listener: result[0].num_listener + delta_listener
                                  } 
                          };
          MongoClient.connect(url, function(err, db2) {
            db2.db(g_mongodb_name).collection(g_collection_rooms).updateOne(myquery, newvalues, function(err, upd) {
              if (err) throw err;
             });
            db2.close(); 
          });
        }
      
    });

    db.close(); 
  });

}
catch {
     // exception
     res.status(500).send();
  }

});

/////////////////////////////////////////
// post API: one user leaves a room
/////////////////////////////////////////
app.put('/rooms/leave', (req, res) => {

  try {
           
    var delta_speaker  = 0;
    var delta_listener = 0; 
    if (req.body.activity == 'S')
       delta_speaker = -1;
    if (req.body.activity == 'L')
       delta_listener = -1;
    
    if (delta_speaker + delta_listener == 0) {
      res.status(200).send('success');
      return; 
    }

    MongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db(g_mongodb_name);

      var query = { room_name: req.body.room_name }; 
      dbo.collection(g_collection_rooms).find(query).toArray(function(err, result) {
          if (err) throw err;
  
          if (result.length <1) {
            res.status(200).send('The room is not found');
            return;   
          }
          
         // res.status(200).send(result[0]);

          var myquery = { room_name: req.body.room_name };
          var newvalues = { $set: {num_speaker: result[0].num_speaker + delta_speaker, 
                                   num_listener: result[0].num_listener + delta_listener
                                  } 
                          };
          
          // update num_speaker/num_listener count 
          MongoClient.connect(url, function(err, db2) {
            db2.db(g_mongodb_name).collection(g_collection_rooms).updateOne(myquery, newvalues, function(err, upd) {
              if (err) throw err;
             });
            db2.close(); 
          });

          res.status(200).send('success');
      });
  
      db.close(); 
    });
  
  }
  catch {
       // exception
       res.status(500).send();
    }
  
  });
  
/////////////////////////////////////////////////////
function validateCustomer(customer) {

   const schema = {
      account_name: Joi.string().min(8).required(),
      last_name: Joi.string().min(2).required(),
      first_name: Joi.string().min(2).required(),
      password: Joi.string().min(8).required()
   };

   const result = Joi.validate(customer, schema);

   return(result);
}


/////////////////////////////////////////////////////
function validateRoom(room) {

  const schema = {
     room_name: Joi.string().min(5).required(),
     title: Joi.string().min(2).required(),
     description: Joi.string().min(2).required(),
     parent: Joi.string().min(0).required(),
     color: Joi.string().min(0).required(),
     tags: Joi.string().min(0).required(),
     owner: Joi.string().min(5).required()
  };

  const result = Joi.validate(room, schema);

  return(result);
}

//const port = process.env.PORT || 3000;
app.listen(3000, () => {
   console.log('Listening port 3000...');
});
