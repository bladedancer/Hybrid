#!/bin/bash
URL=$1

if [ -z $URL ]; then 
  echo "Proxy URL required, e.g. https://meshdemo.apicentral-hybrid.axwaytest.net:443/api/unw-brief"
  exit 1
fi;

LOCATION=()
LOCATION+=('"city":"Dublin", "country":"IE"')
LOCATION+=('"city":"London", "country":"UK"')
LOCATION+=('"city":"New York", "country":"US"')
LOCATION+=('"city":"Boston", "country":"US"')
LOCATION+=('"city":"Dallas", "country":"US"')

INTEREST=(\
    "business" \
    "entertainment" \
    "general" \
    "health" \
    "science" \
    "sports" \
    "technology" \
)

locSize=${#LOCATION[@]}
catSize=${#INTEREST[@]}

while [ 1 ]; do
    index=$(($RANDOM % $locSize))
    loc=${LOCATION[$index]}

    index=$(($RANDOM % $catSize))
    cat=${INTEREST[$index]}

    user="test_$(date +%s%N | cut -b1-13)"
    
    # Create the user
    curl --insecure --location --request POST "$URL/register" \
        --user mykey: \
        --header 'Content-Type: application/json' \
        --data-raw "{\"uid\": \"$user\", $loc, \"interest\": \"$cat\"}"

    # Get the info
    curl --insecure --location --user mykey: --request GET "$URL/$user/info"
    echo
    sleep 0.01
done