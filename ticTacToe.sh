#!/bin/bash

#Function to reset the board
reset(){
   board=( "1" "2" "3" "4" "5" "6" "7" "8" "9" )
}

#Function for toss
toss(){
   flip=$(( RANDOM % 2 + 1 ))
   if [ $flip == 1 ]
   then
      player=("player" "computer")
   else
      player=("computer" "player")
   fi
}

#Function to select symbol, who has won the toss
chooseSymbol(){
if [ ${player[0]} == "player" ]
then
   read -p "Select any one symbol X or O: " selectLetter
   if [ $selectLetter == "X" ]
   then
      symbol=("X" "O")
   else
      symbol=("O" "X")
   fi
else
   if [ $flip == 1 ]
   then
      symbol=("X" "O")
   else
      symbol=("O" "X")
   fi
fi
}

#Calling function to decide who won the toss and select symbol first
reset
toss
chooseSymbol
