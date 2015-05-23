# Rbrpg - a hopefully fun, object oriented code challenge

## Installation

git clone git@github.com:jasonayre/rpg_codetest.git

### Playing the game

bx exe/rbrpg

### Instructions

After playing the game for the first time, you will notice it does not do much yet.
You select a target, a skill, then hit the enemy hero once.
The enemy hero hits you back, and it goes on and on.
The most time consuming parts however, have been created, which lets us focus on
the exciting part, making the game act more like an actual rpg game.

Using the existing code/patterns, we are going to build some additional functionality
on top of the currently very limited functionality.

Lets make the game do more things.

If doing this as a interview code challenge, you have 3 hours to complete the core challenges below.

### Core Challenges

1. In the character base class, you will see the setter method for health being overwritten, to display when damage is applied. A better place for this notification would be in the apply_damage method, and we could also add a apply_healing method and use those methods to display specifically whether damage the character had damage or healing applied, and get rid of the if else on the first line of health=. We could then still display another message after health has been changed i.e.
Character hit for 20
Characters health is now 1000
2. Currently our heroes only have health. Add an additional attribute called "Mana" which can be used to cast additional skill types. Starting mana should equal 100
3. Add an additional warrior skill called bash, which does more damage than a basic attack. Make this skill consume 20 mana when it is used, and ensure that the hero as the required amount of mana before casting (or remove it from the list of skills that can be cast in the skill selection menu when mana is depleted)
4. Make heroes regenerate 5 mana points each turn automatically. Ensure that when we regenerate mana, we show that occuring in the log

### Additional Challenges
1. Create a summon skeleton skill which costs 20 mana, and have the necromancer automatically cast this skill when it has enough mana. The summon skeleton skill should bring a new type of character (descending from minion), into the game. These summoned characters should all have a chance to attack our hero after summoned, and our hero should be able to target and kill the skeletons after they are summoned.
2. Assign an experience point value of 200 to each skeleton kill. When a skeleton is killed, our hero should gain the amount of experience that the skeletons award
3. Show an experience points statistic for our hero on the game screen

### Additional Additional challenges
Here are some additional things you could implement as well, that are probably outside of scope of the challenge in its current state, but if you finish the above in time feel free to move on below if you feel so inclined.

1) Implement the actual leveling up. The character level class may or may not work currently, but it shows you that each level should require more experience to reach the next level.
2) When our hero levels up, let him choose between X more max health points or X more max mana points
3) After a game ends, let our hero play a new game, reusing his existing character
4) Add a strength attribute to the hero. Award attribute points for strength on level up, and have strength make our hero do additional damage.
5) Persist our heros progress to disk, and allow players to load a saved character (hint: check out pstore)

### Hints/Explanation
1. Pry is your friend, and is already included. you can require 'pry' and inserting 'binding.pry' into the code will stop execution of the game and give you a console in the environment
2. You can access the current game state from anywhere with ::Rbrpg::Game.current
3. You can write to the screen with Rbrpg::Game.current.log or Rbrpg::Log.instance

### Gems/library hints
1. Youll want to be familiar with the observer pattern, and the ruby observable module. It is used to watch for things occuring in the game, and send them to the log (check out game state observer). The game state also observer the logs log lines, and then finally handles printing them to the screen.
http://ruby-doc.org/stdlib-1.9.3/libdoc/observer/rdoc/Observable.html

2. The highline command line library is being used to collect user input
https://github.com/JEG2/highline

3. Active support autoload is being used. Basically what this does is prevents you from having to add require statements all over the place (and lazy loads your code, so the first time a constant is referenced, it trys to look up the file where its loaded and load it, to prevent missing constant errors). You're welcome to just use require if it doesn't make sense, when adding new classes/files.
