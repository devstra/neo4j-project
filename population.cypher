LOAD CSV WITH HEADERS FROM 'file:///populationV2.csv' AS line
MERGE (y:Year {year: toInteger(line.year) })
MERGE (c:Country {name: toUpper(line.country) })

CREATE (c)-[r:IN]->(y)
SET r.population_count = toFloat(line.value);
