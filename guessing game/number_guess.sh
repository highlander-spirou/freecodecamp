#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_QUERY ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_QUERY=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

else
  NUM_GAME_QUERY=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = '$USER_QUERY'")
  BEST_GAME_QUERY=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id = '$USER_QUERY'")
  echo "Welcome back, $USERNAME! You have played $NUM_GAME_QUERY games, and your best game took $BEST_GAME_QUERY guesses."
fi

RANDOM_NUM=$((1 + $RANDOM % 1000))
GUESS=1
echo "Guess the secret number between 1 and 1000:"
while read GUESS_NUM
do
  if [[ ! $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS_NUM -gt $RANDOM_NUM ]]
    then
      GUESS=$(( $GUESS + 1 ))
      echo -n "It's lower than that, guess again:"
    elif [[ $GUESS_NUM -lt $RANDOM_NUM ]]
    then
      GUESS=$(( $GUESS + 1 ))
      echo -n "It's higher than that, guess again:"
    else
      echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_QUERY, $GUESS)")
      break;
    fi
  fi
done

