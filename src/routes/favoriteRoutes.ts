import express, { Request, Response } from 'express'
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

//  Define the async handler separately to avoid TypeScript overload conflict
const deleteFavorite = async (req: Request, res: Response) => {
  const db = await getDb()
  const { cca3 } = req.params

  // Try to delete the country from favorites by CCA3 code (case-insensitive)
  const result = await db.run(
    'DELETE FROM favorites WHERE cca3 = ?',
    cca3.toUpperCase()
  )

  // If no row was deleted, return 404
  if (result.changes === 0) {
    return res.status(404).json({ error: 'Country not found in favorites.' })
  }

  return res.status(204).send()
}

// Wrap the async function to handle errors without using async directly inside router.delete
router.delete('/:cca3', (req, res) => {
  deleteFavorite(req, res).catch((error) => {
    console.error(error)
    res.status(500).json({ error: 'Internal server error' })
  })
})

const postFavorite = async (req:Request, res:Response )=>{
  const db = await getDb()
  const {cca3} = req.body

  if (!cca3){
    return res.status(400).send('CCA3 code is required.')
  }

  const country = await db.get('SELECT * FROM countries WHERE cca3 = ?',[cca3.toUpperCase()])
  if(!country){
    return res.status(404).send('Country not found.')
  }
  try {
    await db.run('INSERT INTO favorites(cca3) VALUES (?)',[cca3.toUpperCase()])
    return res.status(201).send('Added to favorites.')
  } catch (error) {
    console.error(error)
      return res.status(500).send('Internal server error.' )
  }
}
router.post('/',(req,res)=>{
  postFavorite(req,res).catch((error)=>{
    console.error(error);
    res.status(500).send('Unexpected error')
  })
})
export default router
