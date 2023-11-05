import json
import requests

r = requests.get('http://localhost:3000')
widgetData = r.json()
i = 0
for widget in widgetData:
  name = widgetData[i]['name']
  color = widgetData[i]['color']
  output = name + ' is ' + color
  i = i + 1
  print(output)