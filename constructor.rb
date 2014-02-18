#!/usr/bin/ruby
# Creating a bot: #=> obj = Bot.new('nick', 'owner', 'server', 'port', 'channel')
# Start the bot:  #=> obj.start connects (and keeps a connection) to the server with the object details
# Add moderators: #=> obj.mods(['username', 'username', 'etc']) -- @owner will automatically be pushed to mods
autoload :Hide, 'io/console'
require_relative 'reqs.rb'
require_relative 'methods/load_methods.rb'

class Hide
  def self.password
    print 'Bot Password: '
    STDIN.noecho(&:gets).chomp; puts
  end
end

class Configuration
  def initialize(nick, owner, server, port, channel)
    @nick, @owner, @server  = nick, owner, server
    @port, @channel, @pass  = port, channel, Hide::password
  end
end

class Bot < Configuration

  def mods(mod_string)
    @mods = [@owner]
    mod_string.split(',').map{|mod| @mods << mod.strip.downcase}
  end

  def start
    @irc = TCPSocket.open(@server, @port)
    state, running = :not_identified, true
    while running
      server_response = @irc.gets
      if server_response.empty? or nil? then sleep(0.5)
      else
        puts "<--- #{server_response}"
        @input = server_response.split(' ')
        if 'PING' == @input[0] then send_data("PONG #{@input[1]}") end
        if state != :identified
          sleep(2)
          login
          state = :identified
        end
        user_array # Push the current user variables
        command = @input[3]
        @chan   = @input[2]

        check_command(command)  # This method will be added via require and will iterate the methods directory and validate commands
        @auth = :not_authenticated # Flush authorization after each method, so that no one can impersonate a previously authed user for ops

        if @alert == :on and get_message.downcase.include?(@owner.downcase)
          alert
        end

        if @input[1] == '376' # 376 - Integer value that determines the end of the MOTD
          @channel.split(',').map{|chan| send_data("JOIN #{chan.strip}")}
        end
      end
    end # end while
  end # end method
end
