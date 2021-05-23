LOAD CSV WITH HEADERS FROM 'file:///house_prices_ukV2.csv' AS line
MERGE (y:Year {year: toInteger(line.year) })
MERGE (c:Country {name: 'United Kingdom' })

Merge (c)-[r:IN]->(y)
SET r.house_price = toFloat(line.value);
