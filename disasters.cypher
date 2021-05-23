LOAD CSV WITH HEADERS FROM 'file:///catastrophes.csv' AS line

MERGE (d:Disaster {id: toInteger(linenumber()), deathCount: coalesce(toInteger(line['Total Deaths']), "UNKNOWN") })
MERGE (dg:DisasterGroup {type: toUpper(line['Disaster Type']) })
MERGE (y:Year {year: toInteger(line['Year']) })
CREATE (d)-[:HAPPENED_IN]->(y)
CREATE (d)-[g:OF_TYPE]->(dg)
SET g.subType = toUpper(line['Disaster Subtype'])
