# Debating on creating bots in bots/
# Have bots defined in a unique folder, i.e. bots/bob/
# Have preferences for the bots loaded via yaml files similar to: bots/bob/prefs.yaml
# This will make it easier to handle things like creating new moderators.
# We can define them right when we use ./mod add username, and don't have to worry about changing the source code for the change to become static
require_relative 'constructor.rb'
channels = '#bleble' # Join multiple channels, now an option
bob = Bot.new('Bob', 'Ninjex', 'hub.irc.hackthissite.org', 6667, channels)
bob.mods('mShred, limdis, law, wall, Shawn') # Make sure you use an array for moderators
bob.start