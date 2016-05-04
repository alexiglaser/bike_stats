import json,csv,sys, urllib2
from datetime import datetime
response = urllib2.urlopen('https://api.tfl.gov.uk/BikePoint?app_id=&app_key=')
html = response.read()
data = json.loads(html)
output = csv.writer(sys.stdout)
print "date_time, id, common_name, lat, lon, bikes, spaces"
for row in data:
    print '"' + datetime.today().strftime("%Y-%m-%d %H:%M:%S" ) + '","'+ str(row['id']) + '","' + str(row['commonName']) + '",' + str(row['lat']) + ',' + str(row['lon']) + ',' + str(row['additionalProperties'][6]['value']) + ',' + str(row['additionalProperties'][7]['value'])
