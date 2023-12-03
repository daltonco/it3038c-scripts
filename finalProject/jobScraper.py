#Imports
import os
import requests
from bs4 import BeautifulSoup

#Reset the output file
open('jobs.txt', 'w').close()

#Introduction & search prompts
print('Welcome to Job Scraper! We will search for job postings using keyword search. Recommended key words include company names, position titles, and job location.')
search = input('What are you looking for in a job?\n')

#Get the HTML content of the requested URL using BS4 as a BS object
URL = "https://realpython.github.io/fake-jobs/"
fakeJobs = requests.get(URL)
fakeSoup = BeautifulSoup(fakeJobs.content, "html.parser")

#Find HTML elements in fakeSoup with the id "ResultsContainer"
fakeResults = fakeSoup.find(id="ResultsContainer")

#Find all divs with the class "card-content". Job postings are separated into divs with this class.
jobElements = fakeResults.find_all("div", class_="card-content")


for jobElement in jobElements:
    #Save job posting data
    titleElement = jobElement.find("h2", class_="title")
    companyElement = jobElement.find("h3", class_="company")
    locationElement = jobElement.find("p", class_="location")
    
    #Generate output string of position data
    outputString = "Position: " + str(titleElement.text.strip()) + "\nCompany: " + str(companyElement.text.strip()) + "\nLocation: " + str(locationElement.text.strip()) + "\n"

    #Does the position contain the search criteria? If yes, save it to jobs.txt
    if(search.lower() in outputString.lower()):
      print(outputString, file=open('jobs.txt', 'a'))

#Open jobs.txt for the user containg all jobs matching the search criteria.
os.startfile(".\jobs.txt")