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

#Condition to select symbol, who won the toss
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

#Function to display gameboard
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

#Function for computer move with winning position
superComputer(){
   currentSym=$sym
   winningOrBlockingMoveForSuperComputer
}

#Function to check winning position for computer move
winningOrBlockingMoveForSuperComputer(){
positionToPlay=-1
      if [ ${board[0]} == $currentSym ] && [ ${board[1]} == $currentSym ] && [ ${board[2]} == "3" ]
      then
               positionToPlay=2
      elif [ ${board[0]} == $currentSym ] && [ ${board[2]} == $currentSym ] && [ ${board[1]} == "2" ]
      then
         positionToPlay=1
      elif [ ${board[1]} == $currentSym ] && [ ${board[2]} == $currentSym ] && [ ${board[0]} == "1" ]
      then
         positionToPlay=0
      elif [ ${board[3]} == $currentSym ] && [ ${board[4]} == $currentSym ] && [ ${board[5]} == "6" ]
      then
         positionToPlay=5
      elif [ ${board[3]} == $currentSym ] && [ ${board[5]} == $currentSym ] && [ ${board[4]} == "5" ]
      then
         positionToPlay=4
      elif [ ${board[4]} == $currentSym ] && [ ${board[5]} == $currentSym ] && [ ${board[3]} == "4" ]
      then
         positionToPlay=3
      elif [ ${board[6]} == $currentSym ] && [ ${board[7]} == $currentSym ] && [ ${board[8]} == "9" ]
      then
         positionToPlay=8
      elif [ ${board[6]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[7]} == "8" ]
      then
         positionToPlay=7
      elif [ ${board[7]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[6]} == "7" ]
      then
         positionToPlay=6
      elif [ ${board[0]} == $currentSym ] && [ ${board[3]} == $currentSym ] && [ ${board[6]} == "6" ]
      then
         positionToPlay=6
      elif [ ${board[0]} == $currentSym ] && [ ${board[6]} == $currentSym ] && [ ${board[3]} == "4" ]
      then
         positionToPlay=3
      elif [ ${board[3]} == $currentSym ] && [ ${board[6]} == $currentSym ] && [ ${board[0]} == "1" ]
      then
         positionToPlay=0
      elif [ ${board[1]} == $currentSym ] && [ ${board[4]} == $currentSym ] && [ ${board[7]} == "8" ]
      then
         positionToPlay=7
      elif [ ${board[1]} == $currentSym ] && [ ${board[7]} == $currentSym ] && [ ${board[4]} == "5" ]
      then
         positionToPlay=4
      elif [ ${board[4]} == $currentSym ] && [ ${board[7]} == $currentSym ] && [ ${board[1]} == "2" ]
      then
         positionToPlay=1
      elif [ ${board[2]} == $currentSym ] && [ ${board[5]} == $currentSym ] && [ ${board[8]} == "9" ]
      then
         positionToPlay=8
      elif [ ${board[2]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[5]} == "6" ]
      then
         positionToPlay=5
      elif [ ${board[5]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[2]} == "3" ]
      then
         positionToPlay=2
      elif [ ${board[0]} == $currentSym ] && [ ${board[4]} == $currentSym ] && [ ${board[8]} == "9" ]
      then
         positionToPlay=8
      elif [ ${board[0]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[4]} == "5" ]
      then
         positionToPlay=4
      elif [ ${board[4]} == $currentSym ] && [ ${board[8]} == $currentSym ] && [ ${board[0]} == "1" ]
      then
         positionToPlay=0
      elif [ ${board[2]} == $currentSym ] && [ ${board[4]} == $currentSym ] && [ ${board[6]} == "7" ]
      then
         positionToPlay=6
      elif [ ${board[2]} == $currentSym ] && [ ${board[6]} == $currentSym ] && [ ${board[4]} == "5" ]
      then
         positionToPlay=4
      elif [ ${board[4]} == $currentSym ] && [ ${board[6]} == $currentSym ] && [ ${board[2]} == "3" ]
      then
         positionToPlay=2
      fi
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

playChance=0
reset
toss
chooseSymbol

for (( noOfTurn=0; noOfTurn < 9 ; noOfTurn++ ))
do
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
