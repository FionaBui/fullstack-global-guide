# Fullstack Global Guide (Express + SQL)

## 🛠️ Technologies

- **Backend**: Node.js, Express, TypeScript
- **Database**: SQLite (local file)
- **Frontend**: React with Vite and TypeScript
- **API format**: JSON

## ✅ Features

- `GET /countries`: Retrieve the full list of countries
- `GET /countries/:cca3`: Get details for a specific country by CCA3 code
- `POST /favorites`: Add a country to the favorites list
- `GET /favorites`: Fetch all favorite countries (joined with country details)
- `PUT /favorites/:cca3`: Update the favorite status (`wishlist`, `visited`, `planning`)
- `DELETE /favorites/:cca3`: Remove a country from the favorites list
- Interactive dropdown in frontend to update status dynamically

## 🧪 Testing & Tools

- ✅ API tested using **Insomnia** for all HTTP methods: GET, POST, PUT, DELETE
- ✅ Frontend tested in browser: React SPA, routing via `react-router-dom`
- ✅ Dropdown for status change tested and persisted via PUT + GET
- ✅ SQLite verified using CLI: data persists correctly after reload

## 📝 Notes

- The project uses local JSON fetch in development, and Express serves the production frontend from the `dist/` folder.
- All routes are RESTful and return proper HTTP status codes.
- The project will continue to be developed further to improve user interface and interactivity.
