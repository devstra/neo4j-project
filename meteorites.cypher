LOAD CSV WITH HEADERS FROM 'file:///meteorite-landings.csv' AS line

MERGE (m:Meteorite {weight: coalesce(toInteger(line.mass), "UNKNOWN"), id: line.id})
MERGE (y:Year {year: coalesce(toInteger(line.year), "UNKNOWN") })
MERGE (c:Coordinates {lat: coalesce(toFloat(line.reclat),"UNKNOWN"), long: coalesce(toFloat(line.reclong),"UNKNOWN") })

CREATE (m)-[:LANDED_IN]->(y)
CREATE (m)-[:LANDED_IN]->(c)
