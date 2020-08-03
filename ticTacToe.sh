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

#Function to printing Tic Tac Toe Board
printBoard(){
   echo "Tic Tac Toe Board"
   echo "-----------------"
   echo "${Arr[0]} ${Arr[1]} ${Arr[2]}"
   echo "${Arr[3]} ${Arr[4]} ${Arr[5]}"
   echo "${Arr[6]} ${Arr[7]} ${Arr[8]}"
   echo "-----------------"
}

reset
toss

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

printBoard
