def mode # This file is responsible for changing several bot modes
  option = get_message
  case option
    when 'fruit' then @fruity  = :on
    when 'no-fruit' then @fruity = :off
    when 'lock' then @lock  = :locked
    when 'unlock' then @lock = :unlocked
    else chan_send("\x034Invalid option: \x03\x033#{option}\x03")
  end
end