#!/bin/bash

#Function to check who won the toss
toss(){
   flip=$(( RANDOM % 2 + 1 ))
   if [ $flip == 1 ]
   then
      player=("player" "computer")
   else
      player=("computer" "player")
   fi
}

#Function to reset the board
reset(){
   board=( "1" "2" "3" "4" "5" "6" "7" "8" "9" )

}

#Calling funtion to reset the board and make toss between player
reset

toss
