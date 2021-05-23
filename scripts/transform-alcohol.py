import csv
values = []
with open('new datasets/alcohol.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=';')
    next(csv_reader,None) # skip the headers
    for row in csv_reader:
        for index in range(1,57):
            if row[index] and row[index].strip():
                values.append({'country':row[0], 'year':1959+index, 'value':row[index]})

with open('alcoholV2.csv', 'w', newline='') as out:
    fieldnames = ['country', 'year', 'value']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")