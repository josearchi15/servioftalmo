import { Router } from "express"
import { getPacientes, getPaciente, createPaciente, updatePaciente, deletePaciente, newPaciente } from "../controllers/pacientes.controller.js"


const router = Router()

router.get("/", getPacientes)

router.get("/new", newPaciente)

router.post("/new", createPaciente)

router.get("/:id", getPaciente)

router.put("/:id", updatePaciente)

// router.get("/:id/edit", getPaciente)

router.delete("/:id", deletePaciente)

export default router