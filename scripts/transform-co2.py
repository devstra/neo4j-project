import csv
values = []
with open('co2_emissions_per_capita_tonnes_1785_2016.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    next(csv_reader,None) # skip the headers
    for row in csv_reader:
        for index in range(1,233):
            if row[index] and row[index].strip():
                values.append({'country':row[0], 'year':1784+index, 'value':row[index]})

with open('co2_emissions_per_capita_tonnes_1785_2016V2.csv', 'w', newline='') as out:
    fieldnames = ['country', 'year', 'value']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")