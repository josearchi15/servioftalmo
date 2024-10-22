import { Router } from "express"
import { openFolder } from "../controllers/uploads.controller.js";

const router = Router({ mergeParams: true }) //hereda los params de la ruta

router.get("/", openFolder)

export default router