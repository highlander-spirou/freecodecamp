#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How may I help you?" 
  
  LIST_OF_SERVICES=$($PSQL "SELECT * FROM services")
  if [[ -z $LIST_OF_SERVICES ]]
  then
    MAIN_MENU "No service available"
  else
    echo "$LIST_OF_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  fi

  read SERVICE_ID_SELECTED
  DO_SERVICE $SERVICE_ID_SELECTED

}

DO_SERVICE() {
  OPTION_SELECTION=$1
  SERVICE_QUERY=$($PSQL "SELECT name FROM services WHERE service_id = $OPTION_SELECTION")
  if [[ -z $SERVICE_QUERY ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER ]]
    then
      echo "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      SCHEDULER $CUSTOMER_NAME $SERVICE_QUERY $OPTION_SELECTION
    else
      SCHEDULER $CUSTOMER $SERVICE_QUERY $OPTION_SELECTION
    fi

  fi
}

SCHEDULER() {
  CUSTOMER_NAME=$1
  SERVICE_NAME=$2
  SERVICE_ID=$3
  echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
  TRIMMED_CUSTOMER_ID=$(echo $CUSTOMER_ID | sed -r 's/^ *| *$//g')
  INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $TRIMMED_CUSTOMER_ID, $SERVICE_ID)")
  echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
