const express = require('express');
const morgan = require('morgan');
const app = express();

app.use(morgan('dev'));


app.get('/', (req,res)=>{
  res.send("<h2> API AcademiaGEEK <h2>");
});

app.get('/estudiantes', (req,res)=>{
    let estudiantes = [];
    estudiantes.push({nombre: 'Maicol',apellido:'Marín',edad:20});
    res.json(estudiantes);
})

app.listen(8083, () =>{
    console.log('App en el puerto 8083');
});