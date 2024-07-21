import { Router } from "express"
import { getPacientes, getPaciente, createPaciente, updatePaciente, deletePaciente, newPaciente } from "../controllers/pacientes.controller.js"
import { createConsulta, deleteConsulta, getConsulta, getConsultas, newConsulta, updateConsulta } from "../controllers/consulta.controller.js"


const router = Router()

router.get("/", getConsultas)

router.get("/new", newConsulta)

router.post("/new", createConsulta)

router.get("/:id_consulta", getConsulta)

router.get("/:id_consulta/edit", getConsulta)

router.put("/:id_consulta/edit", updateConsulta)

router.delete("/:id_consulta", deleteConsulta)

export default router