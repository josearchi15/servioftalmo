import { Router } from "express"
import { getRecetasAnteojos, newRecetaAnteojos, createRecetaAnteojos, getRecetaAnteojos, deleteRecetaAnteojos } from "../controllers/receta-anteojos.controlletr.js"


const router = Router({ mergeParams: true }) //hereda los params de la ruta

router.get("/", getRecetasAnteojos) //CONSULTAS DEL PACIENTE

router.get("/new", newRecetaAnteojos)

router.post("/new", createRecetaAnteojos)

router.get("/:id_consulta", getRecetaAnteojos)

//router.put("/:id_consulta/", updateConsulta)      //no forma parte de la logica del negocio

router.delete("/:id_consulta", deleteRecetaAnteojos)

export default router