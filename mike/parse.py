import json,csv,sys
with open('BikePoint.json') as data_file:
    data = json.load(data_file)
    output = csv.writer(sys.stdout)
    output.writerow(data[0].keys())  # header row
    map(lambda d: d.pop('additionalProperties'), data)
    for row in data:
        output.writerow(row.values())
