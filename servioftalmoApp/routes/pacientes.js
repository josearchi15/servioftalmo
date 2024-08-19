import { Router } from "express"
import { getPacientes, getPaciente, createPaciente, updatePaciente, deletePaciente, newPaciente } from "../controllers/pacientes.controller.js"


const router = Router()

router.get("/", getPacientes) //READ

router.get("/new", newPaciente) //CREATE

router.post("/new", createPaciente) //CREATE

router.get("/:id", getPaciente) //READ

router.put("/:id", updatePaciente)  //UPDATE

router.delete("/:id", deletePaciente) //DELETE
// router.get("/:id/edit", getPaciente)


export default router