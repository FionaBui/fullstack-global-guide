import express from 'express'
import cors from 'cors'
const app = express ()
const PORT = 3000

app.use(cors())
app.use(express.json())

app.get('/', (_req,res)=> {
    res.send('Hello World!')
})

app.listen(PORT, ()=>{
    console.log(`The server is running att http://localhost:${PORT}`);
})