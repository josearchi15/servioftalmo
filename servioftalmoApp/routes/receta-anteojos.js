import { Router } from "express"
import { getRecetasAnteojos, newRecetaAnteojos, createRecetaAnteojos, getRecetaAnteojos, deleteRecetaAnteojos } from "../controllers/receta-anteojos.controller.js"


const router = Router({ mergeParams: true }) //hereda los params de la ruta

router.get("/", getRecetasAnteojos) //nueva receta

router.get("/new", newRecetaAnteojos) //nueva receta

router.post("/new", createRecetaAnteojos)

// router.get("/", newRecetaAnteojos)

router.get("/:id_receta", getRecetaAnteojos)

router.delete("/:id_receta", deleteRecetaAnteojos)

export default router