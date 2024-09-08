import { Router } from "express"

const router = Router()

router.get("/", (req, res) => {
    // console.log(succes_msg, error_msg)
    res.render("index")
})

export default router