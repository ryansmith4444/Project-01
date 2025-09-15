/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR outcome = 0
VAR choice_made = ""
VAR bunt_result = 0
VAR pitch_result = 0



-> start

== start ==
Bottom of the ninth inning. Two outs. Runners in scoring position.
You look over to coach for the signal. The crowd is stating at you. 

+ Go for the big swing - win or lose, the game is in your hands
-> swing
+Trust your teammate to score and lay down a bunt
-> team_player



== swing ==
You look in knowing you have practiced for this moment.
Here comes the pitch
+ swing
-> big_swing
+ take the pitch
-> take_pitch



== team_player ==
You think fast and a bunt could easily score your teammate.
You give coach the look that you both know.
+ Bunt toward third base
-> bunt
+ Pull back because the pitch wasnt a strike.
-> take_pitch


== big_swing == 
You arent thinking of anything else besides how far you can hit the ball.
~ outcome = RANDOM(0,1)
~ choice_made = "swing"
-> final_result


== bunt == 
You decide to make the smart play and tap the ball towards third.
~ bunt_result = RANDOM(0,1)

{ bunt_result == 1:
The ball rolls perfectly down the line. The third basemen is too late.
~ outcome = 1
~ choice_made = "bunt"
-> final_result 

OR:

The bunt goes foul and its a strike.

One more opportunity
-> at_bat 
}


== take_pitch ==
The pitch didnt look good to you so you hold off.

~ pitch_result = RANDOM(0,1)

{pitch_result == 1:
Its a ball and you draw a walk. The bases are loaded. 

+ Let your teammate bat
~ choice_made = "walk"
~ outcome = 1
-> final_result
}


{ pitch_result == 0:
Its a strike and youre out.
~ outcome = 0
~ choice_made = "strikeout" 
->final_result
}

=== at_bat ===
Youre still alive at the plate and the count is full.

+ Go for the hit
->big_swing
+ Go for the bunt again.
-> bunt

=== final_result ===
{ outcome == 1:
The crowd goes crazy! the ball went over the fence!
You win the game with a {choice_made}
}
+ Play again?
~ outcome = 0
~ choice_made = ""
~ bunt_result = 0
~ pitch_result = 0
-> start


+ Quit

-> END
















