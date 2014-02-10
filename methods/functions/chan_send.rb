def chan_send(text)
  puts 'running'
  # If the user is in a pm with the bot, send the text to that user
  if @channel.downcase == @nick.downcase then send_data("PRIVMSG #{@user_name_first} :> #{text}")
  
  # Else send the text to the channel the user is in
  else send_data("PRIVMSG #{@channel} :> #{text}") end
end