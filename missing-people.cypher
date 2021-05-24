LOAD CSV WITH HEADERS FROM 'file:///missing-people.csv' AS line
MERGE (m:MissingPerson {case_number: coalesce(line.case_number, linenumber()), last_name:coalesce(line.last_name, "UNKNOWN"),first_name:coalesce(line.first_name,"UNKNOWN"), age:coalesce(line.age,"UNKNOWN"), sex:line['Sex'], ethnicity:line['Race / Ethnicity']})
MERGE (y:Year {year: coalesce(toInteger(line.year), "UNKNOWN") })
MERGE (c:Country {name: coalesce(toUpper(line.country), "UNKNOWN") })
MERGE (ci:City {name: coalesce(toUpper(line.city), "UNKNOWN") })
MERGE (s:State {name: coalesce(toUpper(line.state), "UNKNOWN") })

CREATE (m)-[:DISAPPEARED_IN]->(y)
CREATE (m)-[:DISAPPEARED_IN]->(ci)
MERGE (ci)-[:PART_OF]->(s)
MERGE (s)-[:PART_OF]->(c);
