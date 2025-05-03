import sqlite3 from "sqlite3";
import { open, Database } from "sqlite";
import { countries } from "../data/countries";
import type { Country } from "../types/Country";

let db: Database

export const getDb = async ()=> {
    if(!db){
        db = await open({
            filename: 'countries.sqlite',
            driver: sqlite3.Database
        })

        await db.run('PRAGMA foreign_keys = ON')

        // Create countries table if it doesn't exist
        await db.run(`
            CREATE TABLE IF NOT EXISTS countries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            capital TEXT,
            region TEXT,
            subregion TEXT,
            population INTEGER,
            flag TEXT,
            languages TEXT,
            currencies TEXT,
            timezones TEXT,
            borders TEXT,
            cca3 TEXT UNIQUE
            )`)

        //Check if the table has no data → insert sample data
        const result = await db.get<{count : number }>('SELECT COUNT(*) as count FROM countries')
        if (result?.count === 0){
          for (const country of countries){
            await db.run(`
              INSERT INTO countries
              (name, capital, region, subregion,population, flag, languages, currencies, timezones, borders, cca3)
              VALUES (?,?,?,?,?,?,?,?,?,?,?)
              ` ,[
                country.name,
                country.capital,
                country.region,
                country.subregion,
                country.population,
                country.flag,
                JSON.stringify(country.languages),
                JSON.stringify(country.currencies),
                JSON.stringify(country.timezones),
                JSON.stringify(country.borders),
                country.cca3
              ]
            )
          }
          console.log("Sample countries inserted into database");
        }
    }
    return db
}