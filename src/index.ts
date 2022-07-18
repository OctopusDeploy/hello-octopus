import express from "express";
import path from "path";

const app = express();
const port = 8080; 
const staticPath = path.join(__dirname, 'static');

app.set('view engine', 'ejs');

app.use('/', express.static(staticPath));

app.get( "/", ( req, res ) => {
    res.render('index', {
        environment: process.env.environment ?? "Unknown"
    })
} );

app.listen( port, () => {
    console.log( `server started at http://localhost:${ port }` );
} );