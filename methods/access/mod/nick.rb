def nick
  nickname = get_message # Grab the desired nickname
  @nick = nickname # Change the config nick to avoid pm confilct (config.rb)
  send_data("NICK #{nickname}") # Send the data to change nicks
end
