#!/bin/bash

#Function to reset the board
reset(){
   Arr=(. . . . . . . . .)
   player=0
	computer=0
}

#Function for toss
toss(){
   flip=$(( RANDOM % 2 + 1 ))
}

toss
reset

#Condition to select symbol, who won the toss
if [ $flip == 1 ]
then
   read -p "Select any one symbol X or O: " player
   if [ $player == "X" ]
   then
  		computer="O"
   else
   	computer="X"
   fi
else
   toss
   if [ $flip == 1 ]
   then
   	computer="X"
   	player="O"
   else
   	computer="O"
   	player="X"
   fi
fi
