import csv
values = []
with open('population-evolution-modifie.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=';')
    next(csv_reader,None) # skip the headers
    for row in csv_reader:
        for index in range(2,62):
            if row[index] and row[index].strip():
                values.append({'country':row[0], 'ccode':row[1], 'year':1958+index, 'value':row[index]})

with open('populationV2.csv', 'w', newline='') as out:
    fieldnames = ['country', 'ccode', 'year', 'value']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")