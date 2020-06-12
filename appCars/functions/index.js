const functions = require('firebase-functions');
const express = require ('express');
const admin = require ('firebase-admin');
const cors = require('cors')({origin: true});
const app = express();

//middlewards
app.use(cors);
app.use(express.urlencoded({extended:true}));
app.use(express.json());

admin.initializeApp(functions.config().firebase);
const db = admin.firestore();

////https://us-central1-momento3apicars.cloudfunctions.net/apicars/createcars
app.post('/createcars', async (req, res) =>{
   try{
    await db.collection('cars').add({
        name: req.body.name, 
        brand: req.body.brand,
        color: req.body.color,
        price: req.body.price,
        category: req.body.category

        });
            res.json({response: "Vehicle Create Successfully"});
    }catch(error){
        res.json({response: error});
    }
});

app.get('/listcars', async (req,res) =>{
    try{
        let cars = [];
        //get all database registers
        let allCars = await db.collection('cars').get();
        for(const doc of allCars.docs){
            let carsToAdd ={
                id: doc.id,
                name: doc.data().name,
                brand: doc.data().brand,
                color: doc.data().color,
                price: doc.data().price,
                category: doc.data().category
            }
            cars.push(carsToAdd);
        }
        res.json({cars: cars});
    }catch(error){
        res.json({response: error});
    }
});

app.put('/updatecars', async (req, res) =>{
    try{
        const{id, name, brand, color, price, category}= req.body;
        let cars = await db.collection('cars').doc(id).set({
            name: name, 
            brand: brand,
            color: color,
            price: price,
            category: category 
        });
        res.json({response: "Vehicle Update Successfully"});
    }catch(error){
        res.json({response: error});
    }
});

app.delete('/deletecars', async (req,res)=> {
    try{
        const id= req.body.id;
        let deletecars = await db.collection('cars').doc(id).delete();
        res.json({response: "Vehicle deleted Successfully"});
    }catch(error){
        res.json({response: error});
    }
});

//https://us-central1-momento3apicars.cloudfunctions.net/apicars
exports.apicars = functions.https.onRequest(app);

