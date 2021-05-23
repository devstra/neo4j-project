LOAD CSV WITH HEADERS FROM 'file:///missing-peopleV2.csv' AS line
MERGE (m:MissingPerson {case_number: line.case_number, last_name:line.last_name,first_name:line.first_name, age:line.age, sex:line.sex, ethnicity:line.ethnicity})
MERGE (y:Year {year: toInteger(line.year) })
MERGE (c:Country {name: toUpper(line.country) })
MERGE (ci:City {name: toUpper(line.city) })
MERGE (s:State {name: toUpper(line.state) })

CREATE (m)-[:DISAPPEARED_IN]->(y)
CREATE (m)-[:DISAPPEARED_IN]->(ci)
MERGE (ci)-[:PART_OF]->(s)
MERGE (s)-[:PART_OF]->(c);
