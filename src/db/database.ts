import sqlite3 from "sqlite3";
import { open } from "sqlite";
import { Database } from "sqlite";

let db: Database

export const getDb = async ()=> {
    if(!db){
        db = await open({
            filename: '.countries.sqlite',
            driver: sqlite3.Database
        })

        await db.run('PRAGMA foreign_keys = ON')

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
    }
    return db
}