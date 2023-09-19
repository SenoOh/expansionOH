#!/bin/bash
curl -X GET --header "Accept: application/json" "http://localhost:8080/rest/items"
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
    people_template="{\"members\":[{\"link\":\"$purl\",\"state\":\"NULL\",\"stateDescription\":{\"step\":1.0,\"pattern\":\"%s\",\"readOnly\":false,\"options\":[]},\"type\":\"Number\",\"name\":\"$new_position_name\",\"label\":\"$new_label Position\",\"tags\":[\"Point\",\"None\"],\"groupNames\":[\"$new_name\"]}],\"link\":\"$url\",\"state\":\"NULL\",\"editable\":false,\"type\":\"Group\",\"name\":\"$new_name\",\"label\":\"$new_label\",\"category\":\"man_2\",\"tags\":[\"Equipment\"],\"groupNames\":[\"Resident\"]}"
    position_template="{\"link\":\"$purl\",\"state\":\"NULL\", \"stateDescription\":{\"step\":1.0,\"pattern\":\"%s\",\"readOnly\":false,\"options\":[]},\"editable\":false,\"type\":\"Number\",\"name\":\"$new_position_name\",\"label\":\"$new_label Position\",\"tags\":[\"Point\",\"None\"],\"groupNames\":[\"$new_name\"]}"
    people_template=''$people_template''
    position_template=''$position_template''
    curl -u $password -i -X PUT --header "Content-Type: application/json" --header "Accept: application/json" -d "$people_template" "$url"
    curl -u $password -i -X PUT --header "Content-Type: application/json" --header "Accept: application/json" -d "$position_template" "$purl"
done

send_request() {
    local new_name=$1
    local new_plate=$2
    local lurl="http://localhost:8080/rest/links/position_$new_name/mqtt:topic:MQTTBroker:Doorplate_106:plate$new_plate"
    curl -u $password -i -X PUT --header "Content-Type: application/json" --header "Accept: application/json" "$lurl"
}

for row in $(echo "$JSON" | jq -c '.[]'); do
    new_name=$(echo "$row" | jq -r .Name | tr '[:upper:]' '[:lower:]') 
    new_plate=$(echo "$row" | jq -r .Plate)
    send_request "$new_name" "$new_plate"
done