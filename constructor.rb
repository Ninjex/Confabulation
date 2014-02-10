#!/usr/bin/ruby
require 'socket' # In the future: require one file, that has all dependancy requires inside of it
require './methods/load_methods.rb'
class Configuration
  def initialize(nick, owner, pass, server, port, channel)
    @nick, @owner, @pass      = nick, owner, pass
    @server, @port, @channel  = server, port, channel
  end
  require './core.rb'
end
#=> obj = Bot.new('nick', 'owner', 'password', 'server', 'port', 'channel')
#=> obj.start connects (and keeps a connection) to the server with the object details
# Create your bots inside /bots I will add a feature later to help construct bots / choose from a list, etc