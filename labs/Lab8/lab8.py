import requests, re
from bs4 import BeautifulSoup

r = requests.get("http://books.toscrape.com").content
soup = BeautifulSoup(r, "lxml")

for item in soup.find_all("li", attrs={"class":"col-xs-6 col-sm-4 col-md-3 col-lg-3"}):
  span = item.find("h3")
  title = span.text
  span = item.find("p", {"class":"price_color"})
  price = span.text
  print("Book %s has a price of %s" % (title, price))