LOAD CSV WITH HEADERS FROM 'file:///alcoholV2.csv' AS line
MERGE (c:Country {name: toUpper(line.country) })
MERGE (y:Year {year: toInteger(line.year) })

CREATE (c)-[r:IN]->(y)
SET r.acohol_consumption = toFloat(line.value);
