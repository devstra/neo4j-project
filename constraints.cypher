// Define constraints
CREATE CONSTRAINT ON (c:Country) ASSERT c.name IS UNIQUE;
CREATE CONSTRAINT ON (y:Year) ASSERT y.year IS UNIQUE;
CREATE CONSTRAINT ON (m:MissingPerson) ASSERT m.caseNumber IS UNIQUE;
CREATE CONSTRAINT ON (ci:City) ASSERT ci.name IS UNIQUE;
CREATE CONSTRAINT ON (s:State) ASSERT s.name IS UNIQUE;
CREATE CONSTRAINT ON (u:Ufo) ASSERT u.id IS UNIQUE;
CREATE CONSTRAINT ON (x:Coordinates) ASSERT (x.lat, x.long) IS NODE KEY;
CREATE CONSTRAINT ON (u:Meteorite) ASSERT u.id IS UNIQUE;
CREATE CONSTRAINT ON (d:Disaster) ASSERT d.id IS UNIQUE;
CREATE CONSTRAINT ON (dg:DisasterGroup) ASSERT dg.type IS UNIQUE;
