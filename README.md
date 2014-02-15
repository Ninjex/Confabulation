Confabulation
=============

Confabultion is an IRC bot framework written in Ruby.
The goal is to make it simple, easy to use, and easy to add on to

Getting started:

Create a new file that will contain your bot, for an example I will call it ```bot.rb```


require the constructor from the main file: ```require_relative 'constructor.rb'```


Create an object from the bot class with the server and some basic information

Syntax: ```# object = Bot.new('Nick', 'Owner', 'server', port, '#channel')```

Example: ```bob = Bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667', '#defocus')```


Next we can choose to add a moderator list to our bot using the mods method from inside ```Class Bot```

This will allow the specified users to access the methods within ```methods/access/mod/```

Define the moderators as an array in the following format:

```bob.mods(['Tim', 'Roger', 'Sherral', 'Jane', 'Jackie'])```

This will grant Tim, Roger, Sherral, Jane, and Jackie moderator access

Run the bot: ```bob.start```

Simply put:

Things to do / define  | variable
---------------------- | ----------------------------------------------------------------------
Require constructor    | require_relative 'constructor.rb'
create a Bot object    | bob = bot.new('Bob', 'Ninjex', 'chat.freenode.net', 6667, '#defocus')
Moderators (optional)  | bob.mods(['john', 'doe', 'bill'])
Start the bot          | bob.start

If you want to add a new 'command' (something the bot will respond to), create a new file with that will be the same as the method name used. Place the file in the correct ```/methods/access/``` folder to restrict it to your likings.

If you want to create functions that the program will use, but not respond to in IRC, place them inside: ```/methods/functions/```
