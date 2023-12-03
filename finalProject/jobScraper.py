import os
import requests
from bs4 import BeautifulSoup

open('jobs.txt', 'w').close()

print('Welcome to Job Scraper! We will search for job postings using keyword search. Recommended key words include company names, position titles, and job location.')
search = input('What are you looking for in a job?\n')

URL = "https://realpython.github.io/fake-jobs/"
fakeJobs = requests.get(URL)

fakeSoup = BeautifulSoup(fakeJobs.content, "html.parser")
fakeResults = fakeSoup.find(id="ResultsContainer")
jobElements = fakeResults.find_all("div", class_="card-content")


for jobElement in jobElements:
    titleElement = jobElement.find("h2", class_="title")
    companyElement = jobElement.find("h3", class_="company")
    locationElement = jobElement.find("p", class_="location")
    
    outputString = "Position: " + str(titleElement.text.strip()) + "\nCompany: " + str(companyElement.text.strip()) + "\nLocation: " + str(locationElement.text.strip()) + "\n"

    if(search.lower() in outputString.lower()):
      print(outputString, file=open('jobs.txt', 'a'))

os.startfile(".\jobs.txt")