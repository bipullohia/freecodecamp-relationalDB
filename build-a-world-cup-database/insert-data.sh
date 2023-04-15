#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#truncate the existing data to insert clean data
echo $($PSQL "TRUNCATE teams, games")

#script to add teams and games table info from games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    #get team_id for winner team
    WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    #if not found
    if [[ -z $WINNER_TEAM_ID ]]
    then
      #insert team into the table
      INSERT_WINNER_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$WINNER')")
      if [[ $INSERT_WINNER_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "inserted into teams table, $WINNER"
      fi
      #get new team_id for winner team
      WINNER_TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    fi

    #get team_id for winner team
    OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    #if not found
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      #insert team into the table
      INSERT_OPP_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$OPPONENT')")
      if [[ $INSERT_OPP_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "inserted into teams table, $OPPONENT"
      fi
      #get new team_id for winner team
      OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    fi

    #inserting rows into the games table
    INSERT_GAMES_RESULT=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
        values ($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo "inserted a row into games table, $YEAR"
    fi
  fi
done