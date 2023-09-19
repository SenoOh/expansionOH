#!/bin/bash
JSON=$(cat ./public/jsonData.json)
password="senoo:senoO" # name:password
for row in $(echo "$JSON" | jq -c '.[]'); do
    echo "$row"
    new_name=$(echo "$row" | jq -r .Name)
    new_label=$(echo "$row" | jq -r .Label)
    new_id=$(echo "$row" | jq -r .ID)
    new_plate=$(echo "$row" | jq -r .Plate)
    new_position_name="position_$new_name"
    url="http://localhost:8080/rest/items/$new_name"
    purl="http://localhost:8080/rest/items/$new_position_name"
    curl -u $password -i -X DELETE --header "Content-Type: application/json" --header "Accept: application/json" "$url"
    curl -u $password -i -X DELETE --header "Content-Type: application/json" --header "Accept: application/json" "$purl"
done
# how to use: ./removePeopleitems.sh password