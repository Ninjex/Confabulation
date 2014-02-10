class Bot < Configuration
  def start
    @irc = TCPSocket.open(@server, @port)
    @state, running = 0, true
    while running
      server_response = @irc.gets
      if server_response.empty? or nil? then sleep(0.5)
      else
        puts "<--- #{server_response}"
        @input = server_response.split(' ')
        'PING' == @input[0] ? send_data("PONG #{@input[1]}") : nil
        if @state == 0 then sleep(2); login; @state += 1 end
        command = @input[3]
        @chan   = @input[2]
        check_command(command)  # This method will be added via require and will iterate the methods directory and validate commands
        if @input[1] == '376' then sleep(2); send_data("JOIN #{@channel}"); sleep(1) end # 376 - Integer value that determines the end of MOTD output
      end
    end
  end
end