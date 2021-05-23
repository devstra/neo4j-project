LOAD CSV WITH HEADERS FROM 'file:///ufo-sightingsV2.csv' AS line

MERGE (y:Year {year: coalesce(toInteger(line.year), "UNKNOWN") })
MERGE (ci:City {name: coalesce(line.city, "UNKNOWN") })
MERGE (s:State {name: coalesce(line.state, "UNKNOWN") })
MERGE (c:Coordinates {lat: coalesce(toFloat(line.lat),"UNKNOWN"), long: coalesce(toFloat(line.long),"UNKNOWN") })

FOREACH (n IN (CASE WHEN line.datetime IS NULL THEN [] ELSE [1] END) |
    MERGE (u:Ufo {id: line.datetime, summary: coalesce(line.text, ""), shape: coalesce(toUpper(line.shape), "UNKNOWN") })
    CREATE (u)-[:HAPPENED_IN]->(y)
    CREATE (u)-[:SEEN_IN]->(ci)
    CREATE (u)-[:SEEN_IN]->(c)
)
MERGE (ci)-[:PART_OF]->(s)
