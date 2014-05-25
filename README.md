URUG Bowling Game Kata Exercise
================================

what is a kata?   (from http://codekata.com/)
---------------------------------------------
####A kata is an exercise in karate where you repeat a form many, many times, making little improvements in each. 

>There are many exercises and challenges that are used as short katas to help programmers improve their craft.  We are going to use one of Uncle Bob's favorite katas, the bowling game, to gain some experience with TDD and using it for problem solving.  The exercise is done in pairs, generally in a ping/pong format (one coder writes a failing test and the other coder solves the test in as simple an approach as possible)  We aren't going to make any extra criteria or restrictions for this meeting but often, in an effort to make things interesting or to push the envelope we set restrictions on the solutions.  For now, any ruby solutions will do that follow the rules below.

>We hope to be able to solve the bowling game challenge in the time allotted which may be an ambitious goal.  Good luck.  here are the rules:

##bowling game example:
####frame 1
>roll 1:  1<br/>
>roll 2:  4<br/>
>score:  5

####frame 2
>roll 1:  4<br/>
roll 2:  5<br/>
score:  14

####frame 3
>roll 1:  6<br/>
roll 2:  4 (spare)<br/>
score:  29

####frame 4
>roll 1:  5<br/>
roll 2:  5 (spare)<br/>
score:  49

####frame 5
>roll 1:  10 (strike)<br/>
score:  60

####frame 6
>roll 1: 0<br/>
roll 2: 1<br/>
score: 61

####frame 7
>roll 1: 7<br/>
roll 2: 3 (spare)<br/>
score: 77

####frame 8
>roll 1: 6<br/>
roll 2: 4 (spare)<br/>
score: 97

####frame 9:
>roll 1: 10 (strike)<br/>
score: 117

####frame 10:
>roll 1: 2<br/>
roll 2: 8 (spare)<br/>
roll 3: 6
###score: 133



>The game consists of 10 frames (or turns) as shown above.  In each frame the player has
two opportunities to knock down 10 pins.  The score for the frame is the total
number of pins knocked down, plus bonuses for strikes and spares.

>A spare is when the player knocks down all 10 pins in two tries.  The bonus for
that frame is the number of pins knocked down by the next roll.  So in frame 3
above, the score is 10 (the total number knock>>ed down) plus a bonus of 5 (the
number of pins knocked down on the next roll.)

>A strike is when the player knocks down all 10 pins on his first try.  The bonus
for that frame is the value of the next two balls rolled.

>In the tenth frame a player who rolls a spare or strike is allowed to roll the extra
balls to complete the frame.  However no more than three balls can be rolled in
tenth frame.

>you are going to Write a class named “Game” that has two methods
roll(pins) is called each time the player rolls a ball.  The argument is the number of pins knocked down.
score() is called only at the very end of the game.  It returns the total score for that game.

>Once you have a solution built to the above spec, we will run it against the test suite we've put together to validate the exercise and see how it comes out.

###PROGRAMMING NOTES:
>1. you may assume that all rolls are valid
	>>a. no frames will amount to more than 10 pins<br/>
	>>b. there will be exactly the correct number of rolls made for the game<br/>
	>>c. you don't need to account for invalid roll parameters (i.e. negative numbers etc.)<br/>
2. the score method will not be called until all rolls for a game have been made<br/>
3. Work in pairs and use TDD to build your solution.  Our tests are using minitest so it will be easiest if you use that in your work.  
4. We have supplied the Gemfile that we used to build our solution, this should be all you need to complete the challenge.

Go for it and have fun!