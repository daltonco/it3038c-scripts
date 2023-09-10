#!/bin/bash
# This script is for lab 2 in IT3038C. This script downloads covid data and displays it.

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
NEGATIVE=$(echo $DATA | jq '.[0].negative')
DATE_UPDATED=$(echo $DATA | jq '.[0].dateChecked')
CURRENTLY_IN_ICU=$(echo $DATA | jq '.[0].inIcuCurrently')
CUMULATIVE_IN_ICU=$(echo $DATA | jq  '.[0].inIcuCumulative')

echo "As of $DATE_UPDATED, there were $POSITIVE positve COVID cases and $NEGATIVE negative COVID cases. There were $CURRENTLY_IN_ICU people in the ICU as of $DATE_UPDATED, totalling to $CUMULATIVE_IN_ICU people being admitted to the ICU due to COVID."
