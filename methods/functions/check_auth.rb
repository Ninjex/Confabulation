def check_auth(user)
  send_data("whois #{user}")
  v, serv = @irc.gets, @irc.gets.split(' ')
  if serv[1] == '307' then @auth = :authenticated end
end