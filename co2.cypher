LOAD CSV WITH HEADERS FROM 'file:///co2_emissions_per_capita_tonnes_1785_2016V2.csv' AS line
MERGE (y:Year {year: toInteger(line.year) })
MERGE (c:Country {name: toUpper(line.country) })

Merge (c)-[r:IN]->(y)
SET r.co2_emissions = toFloat(line.value);
