import { Router } from "express"
import { createConsulta, deleteConsulta, getConsulta, getConsultas, newConsulta } from "../controllers/consulta.controller.js"


const router = Router({ mergeParams: true })

router.get("/", getConsultas) //CONSULTAS DEL PACIENTE

router.get("/new", newConsulta)

router.post("/new", createConsulta)

router.get("/:id_consulta", getConsulta)

//router.put("/:id_consulta/", updateConsulta)      //no forma parte de la logica del negocio

router.delete("/:id_consulta", deleteConsulta)

export default router