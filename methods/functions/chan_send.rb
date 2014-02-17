def chan_send(text)
  if @fruity == :on then text = fruit(text) end

  if @chan.downcase == @nick.downcase # If the user is in pm with the bot
    send_data("PRIVMSG #{@user_name_first} :> #{text}") # Message the user
  else
    send_data("PRIVMSG #{@chan} :> #{text}") # otherwise message the channel
  end
end