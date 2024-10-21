import { Router } from "express"
// import { join } from 'path';
// import { getDirname } from "../public/js/utils.js"
import { openFolder } from "../controllers/uploads.controller.js";

// Get __dirname for this module
// const __dirname = getDirname(import.meta);

const router = Router({ mergeParams: true }) //hereda los params de la ruta

router.get("/", openFolder)
// router.get("/", (req, res) => {
//     console.log(`llego a la ruta`)
//     // Use __dirname
//     const uploadsDir = join(__dirname, '../uploads');
//     console.log(uploadsDir); // Logs the path to the 'uploads' directory
//     res.send(`Esta es la ruta del archivo: ${uploadsDir}`)
// })

export default router