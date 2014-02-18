def mod
  option = @input[4]
  user = @input[5]
  if option == 'add'
    if @mods.include?("#{user.downcase}")
      chan_send("User: #{user} already has moderator rights!")
    else
      @mods << user.downcase
      chan_send("Moderator: #{user} added.")
    end
  elsif option == 'rm'
    if @mods.include?("#{user.downcase}") == false
      chan_send("User: #{user} is not a moderator, no removal actions taken.")
    else
      @mods.delete(user.downcase)
      chan_send("Moderator: #{user} removed.")
    end
  else
    chan_send("Invalid parameters given!") 
  end
end