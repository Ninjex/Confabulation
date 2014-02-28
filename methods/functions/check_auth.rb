def check_auth(user)
  send_data("whois #{user}")
  v, serv = @irc.gets, @irc.gets.split(' ')
  @auth = :authenticated if serv[1] == '307'
end