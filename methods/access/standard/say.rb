def say
  text = get_message
  chan_send(text)
end