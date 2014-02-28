def nick
  nickname = get_message # Grab the desired nickname
  # Maybe do a /whois to determine if nick exists
  # if resp4[1] == '433'
  #   chan_send("Nickname: #{nickname} is already in use!")
  # else
    @nick = nickname # Change the config nick to avoid pm confilct (config.rb)
    send_data("NICK #{nickname}") # Send the data to change nicks
  # chan_send("Debuggin attempted: #{nickname} : #{resp4[1]}")
  # end
end
