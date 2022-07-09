import sys
from random import choice, seed

if len(sys.argv) >= 2:
    seed(sysargv[1])
# if _name_ == 'main':
the_choice = choice(['rock', 'paper', 'scissors'])
you_choice = str(
    input("Enter rock, paper, or scissors to play, stop to end. "))
while you_choice != 'stop':
    if you_choice == "rock" and the_choice == "rock":
        print("Both rock, there is a tie")
    if you_choice == "rock" and the_choice == "paper":
        print("Paper covers rock, you lose")
    if you_choice == "rock" and the_choice == "scissors":
        print("Rock crushes scissors, you win")
    if you_choice == "paper" and the_choice == "rock":
        print("Paper covers rock, you win")
    if you_choice == "paper" and the_choice == "paper":
        print("Both paper, there is a tie")
    if you_choice == "paper" and the_choice == "scissors":
        print("Scissors cut paper, you lose")
    if you_choice == "scissors" and the_choice == "rock":
        print("Rock crushes scissors, you lose")
    if you_choice == "scissors" and the_choice == "paper":
        print("Scissors cuts papep, you win")
    if you_choice == "scissors" and the_choice == "scissors":
        print("Both scissors, there is a tie")
    the_choice = choice(['rock', 'paper', 'scissors'])
    you_choice = str(
        input("Enter rock, paper, or scissors to play, stop to end. "))
