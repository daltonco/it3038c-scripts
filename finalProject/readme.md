# Final Project - Python Web Scraper

## Description

My final project is a web scraper using Python to search for jobs based on provided search criteria, including position title, company name, and position location. If job data matches the search criteria it will be saved to the jobs.txt file located within the respository, and opens it for the user to read once all data has been read and saved. This type of script can save users a ton of time in searching for job data. With some additional scripting, this could even been used to search for job positions across multiple websites, preventing the user from search through each page individually.


## Instructions to Run

1. Clone the repository to your local machine.

2. Navigate to the finalProject directory in CMD.

3. From CMD, create a Python virtual environment using:

```python
python -m venv venv
```

4. From CMD, activate your Python virtual environment using:

```python
venv\Scripts\activate
```

5. From CMD, install the 'requests' library using:

```python
python -m pip install requests
```

6. From CMD, install the 'BeautifulSoup library using:

```python
python -m pip install BeautifulSoup4
```

7. From CMD, run the script

```python
jobscraper.py
```

8. When prompted for search criteria, enter a string you would like the script to find in the job description. Examples include: python, moss, software.

## References

* [SizeLimits](https://github.com/ai/size-limit/blob/main/README.md)
  
* [BeautifulSoup Web Scraper](https://realpython.com/beautiful-soup-web-scraper-python/)
  
* [RealPython](https://realpython.github.io/fake-jobs/)
