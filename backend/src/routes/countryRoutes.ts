import express  from "express";
// Get getDb() function to access the database
import { getDb } from "../db/database";
const router = express.Router()
router.get('/', async (_req, res) => {
    const db = await getDb()
    const countries = await db.all('SELECT * FROM countries')
    res.json(countries)
})

router.get('/:cca3', async (req, res)=>{
    const db = await getDb()
    const {cca3} = req.params

    const country = await db.get('SELECT * FROM countries WHERE cca3 = ?', cca3.toUpperCase())

    if (country){
        res.json(country)
    } else {
        res.status(404).send('Country not found')
    }
})
export default router

