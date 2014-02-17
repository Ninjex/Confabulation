def mod
  option = @input[4]
  user = @input[5]
  if option == 'add'
    @mods << user.downcase
    chan_send("Moderator: #{user} added.")
  elsif option == 'rm'
    @mods.delete(user.downcase)
    chan_send("Moderator: #{user} removed.")
  else
    chan_send("Invalid parameters given!") 
  end
end