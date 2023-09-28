"""
Colton Dalton
Lab 5

Take a birthday date input and calculate how many seconds old you are.
"""
import os
os.system('cls')

from datetime import date
import datetime


print('Hello! I am here to tell you how old you are in seconds. Let us start with the basics, what year were you born in?')
myYear = int(input())

print(str(myYear) +'?! Nice! Now, what month were you born in? (Please enter this as a number)')
myMonth = int(input())

print('Ok so, you were born in the year ' + str(myYear) + ', in month ' + str(myMonth) + ', but what about that last piece? What day of the month were you born?')
myDay = int(input())

birthdate = datetime.date(myYear, myMonth, myDay)

ageInSeconds = (date.today() - birthdate).total_seconds()
print('Thanks! According to the brain of my hyper intelligent creator, you are ' + str(ageInSeconds) + ' seconds old! Nice man, that is a pretty large number! Keep it up!')