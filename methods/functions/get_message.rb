def get_message
  text = @input.drop(4) # Grab all data following a command
  message = text.join(' ')
  message.strip
end