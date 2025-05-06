import express from "express";
import cors from "cors";
import path from "path";
import countryRoutes from "./routes/countryRoutes";
import favoriteRoutes from "./routes/favoriteRoutes";
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// API routes
app.use('/countries', countryRoutes)
app.use('/favorites', favoriteRoutes)

// Serve static frontend files
const frontendPath = path.join(__dirname,'../../frontend/dist')
app.use(express.static(frontendPath))

app.get('/', (_req, res) => {
  res.sendFile(path.join(frontendPath, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`The server is running att http://localhost:${PORT}`);
});
