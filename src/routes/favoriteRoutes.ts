import express from 'express'
import { getDb } from '../db/database'

const router = express.Router()

// GET /favorites – get a favotite list 
router.get('/', async (_req, res) => {
  const db = await getDb()
  const favorites = await db.all(`
    SELECT c.* FROM favorites f
    JOIN countries c ON f.cca3 = c.cca3
  `)
  res.json(favorites)
})

export default router
