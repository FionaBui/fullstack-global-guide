
DROP TABLE IF EXISTS favorites;
DROP TABLE IF EXISTS countries;


CREATE TABLE countries (
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
);


CREATE TABLE favorites (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cca3 TEXT NOT NULL UNIQUE,
  status TEXT DEFAULT 'wishlist',
  FOREIGN KEY (cca3) REFERENCES countries(cca3)
);


INSERT INTO countries (name, capital, region, subregion, population, flag, languages, currencies, timezones, borders, cca3) VALUES
('Vietnam', 'Hanoi', 'Asia', 'Southeast Asia', 98000000, 'https://flagcdn.com/w320/vn.png',
 '["Vietnamese"]', '["VND"]', '["UTC+07:00"]', '["CHN", "LAO", "KHM"]', 'VNM'),

('Sweden', 'Stockholm', 'Europe', 'Northern Europe', 10500000, 'https://flagcdn.com/w320/se.png',
 '["Swedish"]', '["SEK"]', '["UTC+01:00"]', '["NOR", "FIN"]', 'SWE'),

('Germany', 'Berlin', 'Europe', 'Western Europe', 83000000, 'https://flagcdn.com/w320/de.png',
 '["German"]', '["EUR"]', '["UTC+01:00"]', '["AUT","BEL","CZE","DNK","FRA","LUX","NLD","POL","CHE"]', 'DEU'),

('France', 'Paris', 'Europe', 'Western Europe', 67000000, 'https://flagcdn.com/w320/fr.png',
 '["French"]', '["EUR"]', '["UTC+01:00"]', '["AND","BEL","DEU","ITA","LUX","MCO","ESP","CHE"]', 'FRA'),

('Japan', 'Tokyo', 'Asia', 'Eastern Asia', 125000000, 'https://flagcdn.com/w320/jp.png',
 '["Japanese"]', '["JPY"]', '["UTC+09:00"]', '[]', 'JPN'),

('United States', 'Washington, D.C.', 'Americas', 'North America', 331000000, 'https://flagcdn.com/w320/us.png',
 '["English"]', '["USD"]', '["UTC−04:00","UTC−05:00","UTC−06:00","UTC−07:00","UTC−08:00"]', '["CAN","MEX"]', 'USA'),

('Canada', 'Ottawa', 'Americas', 'North America', 38000000, 'https://flagcdn.com/w320/ca.png',
 '["English","French"]', '["CAD"]', '["UTC−03:30","UTC−08:00"]', '["USA"]', 'CAN'),

('Brazil', 'Brasília', 'Americas', 'South America', 213000000, 'https://flagcdn.com/w320/br.png',
 '["Portuguese"]', '["BRL"]', '["UTC−03:00"]', '["ARG","BOL","COL","GUF","GUY","PRY","PER","SUR","URY","VEN"]', 'BRA'),

('Norway', 'Oslo', 'Europe', 'Northern Europe', 5400000, 'https://flagcdn.com/w320/no.png',
 '["Norwegian"]', '["NOK"]', '["UTC+01:00"]', '["FIN","SWE","RUS"]', 'NOR'),

('Australia', 'Canberra', 'Oceania', 'Australia and New Zealand', 25000000, 'https://flagcdn.com/w320/au.png',
 '["English"]', '["AUD"]', '["UTC+10:00"]', '[]', 'AUS');
