import express from "express";
import morgan from "morgan";
import pacientesRoutes from "./routes/pacientes.js"


const app = express();


app.set('view engine', 'ejs')

app.use(express.json())
app.use(express.urlencoded({ extended: true }));
// app.use(express.methodOverride('_method'));
app.use(morgan('dev'))

app.use(pacientesRoutes)

app.listen(3000);
console.log("Server on port 3000");