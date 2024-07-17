import express from "express";
import morgan from "morgan";
import pacientesRoutes from "./routes/pacientes.js"
import indexRoutes from "./routes/index.js"

import { dirname, join } from 'path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();

app.set('view engine', 'ejs')

app.use(express.json())
app.use(express.urlencoded({ extended: true }));
// app.use(express.methodOverride('_method'));
app.use(morgan('dev'))

app.use("/", indexRoutes)
app.use("/pacientes", pacientesRoutes)
app.use(express.static(join(__dirname, 'public')));


app.listen(3000);
console.log("Server on port 3000");
console.log(__dirname)