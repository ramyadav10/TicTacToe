#!/bin/bash

#function to reset the board
reset(){
   Arr=(. . . . . . . . .)
   player=0
}

#function to check who won the toss
toss(){
   flip=$(( RANDOM % 2 + 1 ))

   if [ $flip == 1 ]
   then
      tossWon="player"
   else
      tossWon="Computer"
   fi
}

reset
toss


