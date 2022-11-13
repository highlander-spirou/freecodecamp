#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULTS=$($PSQL "INSERT INTO teams(name) VALUES ('$winner')")
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")

    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULTS=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent')")
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")

    echo "$winner has id $WINNER_ID"
    echo "$opponent has id $OPPONENT_ID"

    INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$year', '$round', '$WINNER_ID', '$OPPONENT_ID', '$winner_goals', '$opponent_goals')")
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games, at $year, $winner wins against $opponent in $round"
    fi
  fi
done