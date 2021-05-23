import csv
values = []
with open('new datasets/missing-people.csv') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    next(csv_reader,None) # skip the headers
    for row in csv_reader:
        valid=True
        # check if some values are empty
        for i in range(9):
            if not row[i] or not row[i].strip():
                valid=False
                break
        if valid:
            values.append({'case_number':row[0], 'year':row[1].split('/')[2], 'last_name':row[2],'first_name':row[3], 'age':row[4], 'city':row[5], 'country':row[6], 'state':row[7], 'sex':row[8], 'ethnicity':row[9]})

with open('missing-peopleV2.csv', 'w', newline='') as out:
    fieldnames = ['case_number', 'year', 'last_name','first_name', 'age', 'city', 'country', 'state', 'sex', 'ethnicity']
    writer = csv.DictWriter(out, fieldnames=fieldnames)
    writer.writeheader()
    for i in values:
        writer.writerow(i)
print("done!")