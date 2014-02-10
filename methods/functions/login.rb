# Pretty standard stuff here, just identifying with the server
def login
  send_data("USER #{@nick} github.com #{@nick} :RubyBot")
  send_data("NICK #{@nick}")
end
