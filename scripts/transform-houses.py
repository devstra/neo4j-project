import csv
from statistics import mean
values_dict = dict()
with open('house_prices_uk.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    next(csv_reader,None) # skip the headers

    for row in csv_reader:
        date = row[0].split("-")
        values_dict.setdefault(date[0], list()).append(int(row[1]))

    for key in values_dict.keys():
        values_dict[key] = mean(values_dict[key])


values = list()
for i in values_dict:
    values.append({'year':i, 'value':values_dict[i]})
    
with open('house_prices_ukV2.csv', 'w', newline='') as out:
    fieldnames = ['year', 'value']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")