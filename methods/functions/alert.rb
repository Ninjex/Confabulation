def alert
  message = get_message
  `xmessage -timeout 10 #{message}`
end