#!/usr/bin/sh

LOCATION=$(cat $HOME/.weater_location)
DATA=$(curl -s "wttr.in/$LOCATION?format=j2&lang=sv")

ACTUAL=$(jq '.current_condition.[0].temp_C' <<< $DATA | tr -d '"')
FEELS=$(jq '.current_condition.[0].FeelsLikeC' <<< $DATA | tr -d '"')
DESC=$(jq '.current_condition.[0].lang_sv.[0].value' <<< $DATA | tr -d '"')

printf '%s°C(%s°C): %s\n' $ACTUAL $FEELS "$DESC"
