LOAD CSV WITH HEADERS FROM 'file:///ufo-sightings.csv' AS line

MERGE (y:Year {year: coalesce(split(line['date_time'], '-')[0]
, "UNKNOWN") })
MERGE (ci:City {name: coalesce(line.city, "UNKNOWN") })
MERGE (s:State {name: coalesce(line.state, "UNKNOWN") })
MERGE (c:Coordinates {lat: coalesce(toFloat(line.city_latitude),"UNKNOWN"), long: coalesce(toFloat(line.city_longitude),"UNKNOWN") })
MERGE (u:Ufo {id: linenumber(), summary: coalesce(line.text, ""), shape: coalesce(toUpper(line.shape), "UNKNOWN") })

CREATE (u)-[:HAPPENED_IN]->(y)
CREATE (u)-[:SEEN_IN]->(ci)
CREATE (u)-[:SEEN_IN]->(c)
MERGE (ci)-[:PART_OF]->(s)
