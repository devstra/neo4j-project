LOAD CSV WITH HEADERS FROM 'file:///internet_users_per_100_people_1960_2015V2.csv' AS line
MERGE (y:Year {year: toInteger(line.year) })
MERGE (c:Country {name: toUpper(line.country) })

Merge (c)-[r:IN]->(y)
SET r.internet_users = toFloat(line.value);
