
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
('Vietnam', 'Hanoi', 'Asia', 'South-Eastern Asia', 98000000, 'https://flagcdn.com/w320/vn.png',
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
 '["English"]', '["AUD"]', '["UTC+10:00"]', '[]', 'AUS'),

('Mexico', 'Mexico City', 'Americas', 'Central America', 126000000, 'https://flagcdn.com/w320/mx.png', '["Spanish"]', '["MXN"]', '["UTC−06:00"]', '["USA","GTM","BLZ"]', 'MEX'),

('Thailand', 'Bangkok', 'Asia', 'South-Eastern Asia', 70000000, 'https://flagcdn.com/w320/th.png', '["Thai"]', '["THB"]', '["UTC+07:00"]', '["MMR","KHM","LAO","MYS"]', 'THA'),

('China', 'Beijing', 'Asia', 'Eastern Asia', 1400000000, 'https://flagcdn.com/w320/cn.png',
 '["Chinese"]', '["CNY"]', '["UTC+08:00"]', '["AFG","BTN","LAO","IND","MNG","NPL","PAK","RUS","VNM"]', 'CHN'),

('Laos', 'Vientiane', 'Asia', 'South-Eastern Asia', 7300000, 'https://flagcdn.com/w320/la.png',
 '["Lao"]', '["LAK"]', '["UTC+07:00"]', '["CHN","KHM","MMR","THA","VNM"]', 'LAO'),

('Singapore', 'Singapore', 'Asia', 'South-Eastern Asia', 5700000, 'https://flagcdn.com/w320/sg.png',
 '["English","Malay","Mandarin","Tamil"]', '["SGD"]', '["UTC+08:00"]', '[]', 'SGP'),

('Ukraine', 'Kyiv', 'Europe', 'Eastern Europe', 41000000, 'https://flagcdn.com/w320/ua.png', '["Ukrainian"]', '["UAH"]', '["UTC+02:00"]', '["RUS","POL","ROU"]', 'UKR'),

('Spain', 'Madrid', 'Europe', 'Southern Europe', 47000000, 'https://flagcdn.com/w320/es.png', '["Spanish"]', '["EUR"]', '["UTC+01:00"]', '["PRT","FRA","AND"]', 'ESP'),

('Austria', 'Vienna', 'Europe', 'Central Europe', 9000000, 'https://flagcdn.com/w320/at.png',
 '["German"]', '["EUR"]', '["UTC+01:00"]', '["CZE","DEU","HUN","ITA","LIE","SVK","SVN","CHE"]', 'AUT'),

('Switzerland', 'Bern', 'Europe', 'Central Europe', 8700000, 'https://flagcdn.com/w320/ch.png',
 '["German","French","Italian","Romansh"]', '["CHF"]', '["UTC+01:00"]', '["AUT","FRA","ITA","LIE","DEU"]', 'CHE'),

('Czech Republic', 'Prague', 'Europe', 'Central Europe', 10700000, 'https://flagcdn.com/w320/cz.png',
 '["Czech"]', '["CZK"]', '["UTC+01:00"]', '["AUT","DEU","POL","SVK"]', 'CZE'),

('Angola', 'Luanda', 'Africa', 'Middle Africa', 32800000, 'https://flagcdn.com/w320/ao.png', '["Portuguese"]', '["AOA"]', '["UTC+01:00"]', '["COD","NAM","ZMB"]', 'AGO'),

('Nigeria', 'Abuja', 'Africa', 'Western Africa', 206000000, 'https://flagcdn.com/w320/ng.png', '["English"]', '["NGN"]', '["UTC+01:00"]', '["NER","BEN","CMR","TCD"]', 'NGA'),

('Federated States of Micronesia', 'Palikir', 'Oceania', 'Micronesia', 115000, 'https://flagcdn.com/w320/fm.png', '["English"]', '["USD"]', '["UTC+10:00"]', '[]', 'FSM'),

('Cuba', 'Havana', 'Americas', 'Caribbean', 11300000, 'https://flagcdn.com/w320/cu.png', '["Spanish"]', '["CUP"]', '["UTC−05:00"]', '[]', 'CUB'),

('Kazakhstan', 'Astana', 'Asia', 'Central Asia', 18700000, 'https://flagcdn.com/w320/kz.png', '["Kazakh","Russian"]', '["KZT"]', '["UTC+06:00"]', '["RUS","CHN","UZB","KGZ"]', 'KAZ'),

('India', 'New Delhi', 'Asia', 'Southern Asia', 1380000000, 'https://flagcdn.com/w320/in.png', '["Hindi","English"]', '["INR"]', '["UTC+05:30"]', '["BGD","CHN","PAK","NPL"]', 'IND'),

('Turkey', 'Ankara', 'Asia', 'Western Asia', 84000000, 'https://flagcdn.com/w320/tr.png', '["Turkish"]', '["TRY"]', '["UTC+03:00"]', '["ARM","SYR","GEO","GRC"]', 'TUR'),

('Kenya', 'Nairobi', 'Africa', 'Eastern Africa', 53700000, 'https://flagcdn.com/w320/ke.png', '["Swahili","English"]', '["KES"]', '["UTC+03:00"]', '["UGA","TZA","ETH"]', 'KEN'),

('Egypt', 'Cairo', 'Africa', 'Northern Africa', 102000000, 'https://flagcdn.com/w320/eg.png', '["Arabic"]', '["EGP"]', '["UTC+02:00"]', '["ISR","LBY","SDN"]', 'EGY'),

('New Zealand', 'Wellington', 'Oceania', 'Australia and New Zealand', 5000000, 'https://flagcdn.com/w320/nz.png', '["English","Māori"]', '["NZD"]', '["UTC+12:00"]', '[]', 'NZL'),

('Samoa', 'Apia', 'Oceania', 'Polynesia', 202506, 'https://flagcdn.com/w320/ws.png', '["Samoan","English"]', '["WST"]', '["UTC+13:00"]', '[]', 'WSM'),

('Netherlands', 'Amsterdam', 'Europe', 'Western Europe', 17400000, 'https://flagcdn.com/w320/nl.png', '["Dutch"]', '["EUR"]', '["UTC+01:00"]', '["BEL","DEU"]', 'NLD'),

('South Korea', 'Seoul', 'Asia', 'Eastern Asia', 52000000, 'https://flagcdn.com/w320/kr.png', '["Korean"]', '["KRW"]', '["UTC+09:00"]', '["PRK"]', 'KOR'),

('Haiti', 'Port-au-Prince', 'Americas', 'Caribbean', 11400000, 'https://flagcdn.com/w320/ht.png', '["French","Creole"]', '["HTG"]', '["UTC−05:00"]', '["DOM"]', 'HTI'),

('Bangladesh', 'Dhaka', 'Asia', 'Southern Asia', 170000000, 'https://flagcdn.com/w320/bd.png',
 '["Bengali"]', '["BDT"]', '["UTC+06:00"]', '["IND","MMR"]', 'BGD'),

('Nepal', 'Kathmandu', 'Asia', 'Southern Asia', 30000000, 'https://flagcdn.com/w320/np.png',
 '["Nepali"]', '["NPR"]', '["UTC+05:45"]', '["CHN","IND"]', 'NPL'),

('Chile', 'Santiago', 'Americas', 'South America', 19000000, 'https://flagcdn.com/w320/cl.png', '["Spanish"]', '["CLP"]', '["UTC−04:00"]', '["ARG","PER","BOL"]', 'CHL'),

('Pakistan', 'Islamabad', 'Asia', 'Southern Asia', 240000000, 'https://flagcdn.com/w320/pk.png',
 '["Urdu","English"]', '["PKR"]', '["UTC+05:00"]', '["AFG","CHN","IND","IRN"]', 'PAK'),

('Lebanon', 'Beirut', 'Asia', 'Western Asia', 6825442, 'https://flagcdn.com/w320/lb.png',
 '["Arabic", "French", "English"]', '["LBP"]', '["UTC+02:00"]', '["ISR", "SYR"]', 'LBN'),

('Jordan', 'Amman', 'Asia', 'Western Asia', 10203140, 'https://flagcdn.com/w320/jo.png',
 '["Arabic"]', '["JOD"]', '["UTC+03:00"]', '["IRQ", "ISR", "SAU", "SYR"]', 'JOR'),

('Solomon Islands', 'Honiara', 'Oceania', 'Melanesia', 652858, 'https://flagcdn.com/w320/sb.png',
 '["English"]', '["SBD"]', '["UTC+11:00"]', '[]', 'SLB'),

('Vanuatu', 'Port Vila', 'Oceania', 'Melanesia', 307145, 'https://flagcdn.com/w320/vu.png',
 '["Bislama", "English", "French"]', '["VUV"]', '["UTC+11:00"]', '[]', 'VUT'),

('Panama', 'Panama City', 'Americas', 'Central America', 4300000, 'https://flagcdn.com/w320/pa.png', '["Spanish"]', '["PAB"]', '["UTC−05:00"]', '["COL","CRI"]', 'PAN'),

('Serbia', 'Belgrade', 'Europe', 'Southeast Europe', 6885000, 'https://flagcdn.com/w320/rs.png',
 '["Serbian"]', '["RSD"]', '["UTC+01:00"]', '["BIH", "BGR", "HRV", "HUN", "MKD", "MNE", "ROU", "XKX"]', 'SRB'),

('Albania', 'Tirana', 'Europe', 'Southeast Europe', 2877797, 'https://flagcdn.com/w320/al.png',
 '["Albanian"]', '["ALL"]', '["UTC+01:00"]', '["MNE", "GRC", "XKX", "MKD"]', 'ALB'),

('Bosnia and Herzegovina', 'Sarajevo', 'Europe', 'Southeast Europe', 3280819, 'https://flagcdn.com/w320/ba.png',
 '["Bosnian", "Croatian", "Serbian"]', '["BAM"]', '["UTC+01:00"]', '["HRV", "MNE", "SRB"]', 'BIH');


