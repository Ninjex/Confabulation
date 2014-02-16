def chan_send(text)
  if @fruity == :on then text = fruit(text) end
  if @channel.downcase == @nick.downcase then send_data("PRIVMSG #{@user_name_first} :> #{text}")
  else send_data("PRIVMSG #{@channel} :> #{text}") end
end