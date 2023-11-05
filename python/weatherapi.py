import json 
import requests 
 
print('Please enter your zip code:') 
zip = input() 
 
r = requests.get('http://api.openweathermap.org/data/2.5/weather?zip=%s,us&appid=e500b2a1ca9f8cb588a3c55b4cf7fd1e' % zip) 
data=r.json() 
print(data['weather'][0]['description']) 