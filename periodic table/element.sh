PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$1
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then 
    ELEMENT_QUERY=$($PSQL "SELECT * FROM elements WHERE atomic_number = $ELEMENT")
  else
    ELEMENT_QUERY=$($PSQL "SELECT * FROM elements WHERE symbol = '$ELEMENT' or name = '$ELEMENT'")
  fi
  if [[ -z $ELEMENT_QUERY ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_QUERY" | while read atomic_number BAR symbol BAR name
    do
      PROPERTY_QUERY=$($PSQL "select atomic_mass, melting_point_celsius, boiling_point_celsius, type from properties p INNER JOIN types t ON p.type_id = t.type_id WHERE p.atomic_number = $atomic_number")
      echo "$PROPERTY_QUERY" | while read atomic_mass BAR melt BAR boil BAR type
      do
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melt celsius and a boiling point of $boil celsius."
      done
    done
  fi

fi