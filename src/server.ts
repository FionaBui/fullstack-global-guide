import express from "express";
import cors from "cors";
import { getDb } from "./db/database";
import countryRoutes from "./routes/countryRoutes";
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// app.get("/", async(_req, res) => {
//   const db = await getDb()
//   const countries = await db.all('SELECT * FROM countries')
//   res.json(countries)
// });

app.use('/countries', countryRoutes)

app.listen(PORT, () => {
  console.log(`The server is running att http://localhost:${PORT}`);
});
