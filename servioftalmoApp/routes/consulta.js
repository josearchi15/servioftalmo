import { Router } from "express"
import { createConsulta, deleteConsulta, getConsulta, getConsultas, newConsulta, updateConsulta } from "../controllers/consulta.controller.js"


const router = Router({ mergeParams: true })

router.get("/", getConsultas) //CONSULTAS DEL PACIENTE

router.get("/new", newConsulta)

router.post("/new", createConsulta)

router.get("/:id_consulta", getConsulta)

router.get("/:id_consulta/edit", getConsulta)

router.put("/:id_consulta/edit", updateConsulta)

router.delete("/:id_consulta", deleteConsulta)

export default router