require_relative 'constructor.rb'

bob = Bot.new('Bob', 'Ninjex', 'hub.irc.hackthissite.org', 6667, '#metasploit')
bob.mods(['mShred', 'limdis', 'law', 'wall', 'Shawn']) # Make sure you use an array for moderators
bob.start