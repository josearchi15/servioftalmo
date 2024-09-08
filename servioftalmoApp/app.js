import express from "express";
import morgan from "morgan";
import methodOverride from "method-override";
import indexRoutes from "./routes/index.js"
import pacientesRoutes from "./routes/pacientes.js"
import consultaRoutes from "./routes/consulta.js"
import cookieSession from "cookie-session";
import flash from "connect-flash/lib/flash.js";


import { dirname, join } from 'path';
import { fileURLToPath } from 'node:url';


// Global variables
const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();

// App configuration
app.set('view engine', 'ejs')

// Middlewares
app.use(express.json())
app.use(express.urlencoded({ extended: true }));
app.use(methodOverride('_method'));
app.use(morgan('dev'))
app.use(flash());
app.use(cookieSession({
    name: 'session',
    keys: ['secretKey1', 'secretKey2'], // You should replace these with your own secret keys
    maxAge: 24 * 60 * 60 * 1000 // 24 hours
}));


// Middleware to make flash messages available to all views
app.use((req, res, next) => {
    res.locals.success_msg = req.flash('success_msg');
    res.locals.error_msg = req.flash('error_msg');
    next();
});

// Routes
app.use("/", indexRoutes)
app.use("/pacientes", pacientesRoutes)
app.use("/pacientes/:id/consulta", consultaRoutes)
app.use(express.static(join(__dirname, 'public')));


app.listen(3000);
console.log("Server on port 3000");
console.log(__dirname)