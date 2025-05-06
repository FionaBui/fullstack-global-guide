import sqlite3 from "sqlite3";
import { open, Database } from "sqlite";
import fs from "fs/promises";
import path from "path";

let db: Database;

export const getDb = async () => {
  if (!db) {
    db = await open({
      filename: "countries.sqlite",
      driver: sqlite3.Database,
    });

    await db.run("PRAGMA foreign_keys = ON");

    const result = await db.get<{ count: number }>(
      "SELECT COUNT(*) as count FROM countries"
    );

    if (result?.count === 0) {
      const sqlPath = path.join(__dirname, "../data/countries.sql");
      const sql = (await fs.readFile(sqlPath)).toString();
      await db.exec(sql);
      console.log("run countries.sql to get data");
    }
  }

  return db;
};
