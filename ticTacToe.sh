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

#Function to select symbol, who won the toss
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

#Functon to display Gameboard
displayBoard(){
echo "Board"
echo "-------------------------"
echo "${board[0]} ${board[1]} ${board[2]}"
echo "${board[3]} ${board[4]} ${board[5]}"
echo "${board[6]} ${board[7]} ${board[8]}"
echo "-------------------------"
}

#Function to check Winning position
TicTacToeApp(){
  if [ "${board[0]}" == "${board[1]}" ] && [ "${board[1]}" == "${board[2]}" ]
   then
      gamestatus=1
   elif [ "${board[3]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[5]}" ]
   then
      gamestatus=1
   elif [ "${board[6]}" == "${board[7]}" ] && [ "${board[7]}" == "${board[8]}" ]
   then
      gamestatus=1
   elif [ "${board[0]}" == "${board[3]}" ] && [ "${board[3]}" == "${board[6]}" ]
   then
      gamestatus=1
   elif [ "${board[1]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[7]}" ]
   then
      gamestatus=1
   elif [ "${board[2]}" == "${board[5]}" ] && [ "${board[5]}" == "${board[8]}" ]
   then
      gamestatus=1
   elif [ "${board[0]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[8]}" ]
   then
      gamestatus=1
   elif [ "${board[2]}" == "${board[4]}" ] && [ "${board[4]}" == "${board[6]}" ]
   then
      gamestatus=1
   else
      gamestatus=0
   fi
}

#Function to make a move by computer
superComputer(){
   while(true)
   do
      temp=$(( RANDOM % 9 + 1 ))
      if [ ${board[ $temp - 1 ]} != "X" ] && [ ${board[ $temp - 1 ]} != "O" ]
      then
         positionToPlay=$temp
      break
      fi
   done
}

#Function to start game 
playMove(){
   playerChange=$playChance
   if [ ${player[$playChance]} == "computer" ]
   then
      sym=${symbol[$playChance]}
      echo "Computer Played"
      superComputer
   else
      sym=${symbol[$playChance]}
      displayBoard
      read -p "Please select a postion to play(1-9)" positionToPlay
   fi

	board[ $positionToPlay - 1 ]=$sym
	TicTacToeApp
	winner=$gamestatus
	playChance=$(( $playChance + 1 ))
}

#Initialising the variables
playChance=0

#Calling Function to Reset Board
reset

#Calling Toss Function
toss

#Calling selection of symbol function
chooseSymbol

for (( noOfTurn=0; noOfTurn < 9 ; noOfTurn++ ))
do
#Calling function to start game
   playMove

   if [ $winner == 1 ]
   then
      echo "Winner is ${player[playerChange]}"
      displayBoard
   break
   fi

   if [ $noOfTurn == 8 ]
   then
      echo "Match is Tie"
      displayBoard
   fi
	playChance=$(( $playChance % 2 ))
done
