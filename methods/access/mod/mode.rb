def mode # This file is responsible for changing several bot modes
  option    = @input[4]
  modifier  = @input[5]
  if option == 'fruit'
    if modifier == 'on'
      @fruity = :on
      chan_send("Fruity mode activated <3")
    elsif modifier == 'off'
      @fruity = :off
      chan_send("Fruity mode deactivated.")
    else
      chan_send("Invalid option: #{modifier} for fruity mode. Please use: 'off' or 'on'")
    end

  elsif option == 'lock'
    if modifier == 'on'
      @lock = :locked
      chan_send("Entered lockdown mode!")
    elsif modifier == 'off'
      @lock = :unlocked
      chan_send("Exiting lockdown mode!")
    else
      chan_send("Invalid option: #{modifier} for lock mode. Please use: 'off' or 'on'")
    end

  elsif option == 'alert'
    if modifier == 'on'
      @alert = :on
      chan_send("Converting to alert mode!")
    elsif modifier == 'off'
      @alert = :off
      chan_send("Dropping out of alert mode!")
    else
      chan_send("Invalid option: #{modifer} for alert mode. Please use: 'off' or 'on'")
    end

  else
    chan_send("\x034Invalid Mode: \x03\x033#{option}\x03")
  end
end