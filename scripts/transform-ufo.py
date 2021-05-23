import csv
values = list()
with open('new datasets/ufo-sightings.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    next(csv_reader,None) # skip the headers
    for row in csv_reader:
        # check that date_time is not empty
        if row[3] and row[3].strip():
            values.append({'datetime':row[3], 'city':row[1], 'state':row[2], 'year':row[3].split("-")[0], 'shape':row[4], 'text':row[8], 'lat':row[10], 'long':row[11]})

with open('ufo-sightingsV2.csv', 'w', newline='') as out:
    fieldnames = ['datetime','city','state','year','shape','text','lat','long']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")