import { Router } from "express"
import { getPacientes, getPaciente, createPaciente, updatePaciente, deletePaciente, newPaciente } from "../controllers/pacientes.controller.js"


const router = Router()

router.get("/", getPacientes) //READ

router.get("/new", newPaciente) //CREATE

router.post("/new", createPaciente) //CREATE

router.get("/:id", getPaciente) //READ   PEDNIENTE DETALLES

router.put("/:id", updatePaciente)  //UPDATE  PENDIENTE

router.delete("/:id", deletePaciente) //DELETE

export default router