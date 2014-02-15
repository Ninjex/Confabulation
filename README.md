Confabulation
=============

Confabultion is an IRC bot framework written in Ruby.<br>
The goal is to make it simple to use, maintain, and add onto.<br>
Feel free to contribute methods, design changes, etc!

Getting started:

  1. Create a new file that will contain your bot, for an example I will call it ```bot.rb```<br>
Require the constructor from the main file: ```require_relative 'constructor.rb'```


  2. Create an object from the bot class with the server and some basic information<br>
Syntax:  ```# object = Bot.new('Nick', 'Owner', 'server', port, '#channel')```<br>
Example: ```bob = Bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667', '#defocus')```


  3. Next we can choose to add a moderator list to our bot using the mods method from inside ```Class Bot```<br>
This will allow the specified users to access the methods within ```methods/access/mod/```<br>
Define the moderators as an array in the following format:<br>
```bob.mods(['Tim', 'Roger', 'Sherral', 'Jane', 'Jackie'])```<br>
This will grant Tim, Roger, Sherral, Jane, and Jackie moderator access

  4. Run the bot: ```bob.start```<br>
Our bot file should now look similar to the following:
```
# bot.rb
# Creating a bot
require_relative 'constructor.rb'
bob = Bot.new('Bob', 'Ninjex', 'hub.irc.hackthissite.org', 6667, '#metasploit')
bob.mods(['mShred', 'limdis', 'law', 'wall', 'Shawn']) # Make sure you use an array for moderators
bob.start
```
Simply put:

Things to do / define  | variable
---------------------- | ----------------------------------------------------------------------
Require constructor    | require_relative 'constructor.rb'
create a Bot object    | bob = bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667, '#defocus')
Moderators (optional)  | bob.mods(['john', 'doe', 'bill'])
Start the bot          | bob.start

If you want to add a new 'command' (something the bot will respond to), create a new file with the same name as the method name. Place the file in the correct ```/methods/access/``` folder to restrict it to your likings.<br>
For example, file ```joke.rb``` should contain the method name 'joke' (```def joke```) and will be run with ```./joke``` in IRC

If you want to create functions that the program will use, but not respond to in IRC, place them inside: ```/methods/functions/```
