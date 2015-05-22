# Rbrpg - a hopefully fun, object oriented code challenge

## Installation

git clone git@github.com:jasonayre/rpg_codetest.git

### Playing the game

bx exe/rbrpg

### Instructions

After playing the game for the first time, you will notice it does not do much yet.
You select a target, a skill, then hit the enemy hero once, and its over.
Only one turn elapses, and the enemy hero cannot hit the player hero back.
The most time consuming parts however, have been created, which lets us focus on
the exciting part, making the game act more like an actual rpg game.

Using the existing code/patterns, we are going to build some additional functionality
on top of the currently very limited functionality.

Lets make the game do more things.

If doing this as a interview code challenge, you have 3 hours to complete the core challenges below.

### Core Challenges

1. Make the enemy hero hit the player hero during it's turn
2. Ensure the game does not end until one of the hero's (player or enemy) health reaches 0. When a turn is finished, a new one should be started
3. Currently our heroes only have health. Add an additional attribute called "Mana" which can be used to cast additional skill types. Starting mana should equal 100
4. Add an additional warrior skill called bash, which does more damage than a basic attack. Make this skill consume 20 mana when it is used, and ensure that the hero has the required amount of mana before casting (or remove it from the list of skills that can be cast in the skill selection menu when mana is depleted)
5. Make heroes regenerate 5 mana points each turn automatically. Ensure that when we regenerate mana, we show that occuring in the log
6. Make the log show the last 10 actions that occured. Currently it shows 1 line at a time after the character stats area.

### Additional Challenges
1. Create a summon skeleton skill which costs 20 mana, and have the necromancer automatically cast this skill when it has enough mana. The summon skeleton skill should bring a new type of character (descending from minion), into the game. These summoned characters should all have a chance to attack our hero after summoned, and our hero should be able to target and kill the skeletons after they are summoned.
2. Assign an experience point value of 200 to each skeleton kill. When a skeleton is killed, our hero should gain the amount of experience that the skeletons award
3. Show an experience points statistic for our hero on the game screen

### Additional Additional challenges
Here are some additional things you could implement as well, that are probably outside of scope of the challenge in its current state, but ideas for future challenges.

1) Implement the actual leveling up. The character level class may or may not work currently, but it shows you that each level should require more experience to reach the next level.
2) When our hero levels up, let him choose between 10 more max health points or 10 more max mana points
3) After a game ends, let our hero play a new game, reusing his existing character
4) Persist our heros progress to disk, and allow players to load a saved character (hint: check out pstore)

### Hints/Explanation
1. Pry is your friend, and is already included. you can require 'pry' and inserting 'binding.pry' into the code will stop execution of the game and give you a console in the environment
2. You can access the current game state from anywhere with ::Rbrpg::Game.current
3. You can write to the screen with Rbrpg::Game.current.log or Rbrpg::Log.instance
