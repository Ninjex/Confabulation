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
Example: ```bob = Bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667', '#defocus')```<br>
In addition, if you would like to join multiple channels at load, define them as a string separated by commas and pass it to the object where the channels would be.<br>
  Example:<br>
  ```
  channels = '#coffeesh0p, #metasploit, #bots'
  bob = Bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667, channels)
  ``` 


  3. Next we can choose to add a moderator list to our bot using the mods method from inside ```Class Bot```<br>
This will allow the specified users to access the methods within ```methods/access/mod/```<br>
Define the moderators as an separated comma string in the following format:<br>
```bob.mods(['Tim, Roger, Sherral, Jane, Jackie')```<br>
This will grant Tim, Roger, Sherral, Jane, and Jackie moderator access

  4. Run the bot: ```bob.start```<br>
Our bot file should now look similar to the following:
```
# bot.rb
# Creating a bot
require_relative 'constructor.rb'
bob = Bot.new('Bob', 'Ninjex', 'hub.irc.hackthissite.org', 6667, '#metasploit')
bob.mods('mShred, limdis, law, wall, Shawn')
bob.start
```
Simply put:

Things to do / Define  | How to define / do it
---------------------- | ----------------------------------------------------------------------
Require Constructor    | require_relative 'constructor.rb'
Create a Bot object    | bob = Bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667, '#defocus')
Multi Chans (optional) | channels = '#coffeesh0p, #metasploit, #bots'
Moderators (optional)  | bob.mods('john', 'doe', 'bill')
Start the bot          | bob.start

If you want to add a new 'command' (something the bot will respond to), create a new file with the same name as the method name. Place the file in the correct ```/methods/access/``` folder to restrict it to your likings.<br>
For example, file ```joke.rb``` should contain the method name 'joke' (```def joke```) and will be run with ```./joke``` in IRC

If you want to create functions that the program will use, but not respond to in IRC, place them inside: ```/methods/functions/```
