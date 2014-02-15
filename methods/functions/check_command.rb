# This script will check the the variable command input[3], and see if it has a match for a function
# If it finds a match, it will execute the command.
# Note that we search the arrays from functions.rb and restrict access appropriately
# If the bot is on lockdown mode, let the user know and don't pass functions; unless it's the admin
def check_ban # add code here (or under /function to check if a user is banned)
  false
end

def check_command(command)
  restrict = [@nick, 'NickServ', 'ChanServ', 'IRC', 'ING', 'PING'] # Things to not check auth on
  if @locked == true and @full_user != @owner
    chan_send("Sorry, #{@user_name_first}, I am currently locked (Probably for maintenance)")
  else

    # Don't attempt to check the command if it's the server, nickserv, PING, etc
    unless @user_name_first.include?(':') or @user_name_first.include?('.') or restrict.include?(@user_name_first)

      # ITERATE OVER MOD COMMANDS AND AUTH #
      if @@mod_commands.include?(command)
        check_auth(@user_name_first)
        if check_mod == true and @auth == :authenticated
          @@mod_commands.each do |method|
            if command == method
              command.gsub!(/[:.\/]/,'')
              send(command)
            end
          end
        end

      # ITERATE OVER ADMIN COMMANDS AND AUTH #
      elsif @@admin_commands.include?(command)
        check_auth(@user_name_first)
        if @user_name_first == @owner and @auth == :authenticated
          @@admin_commands.each do |method|
            if command == method
              command.gsub!(/[:.\/]/,'')
              send(command)
            end
          end
        end

      # ITERATE OVER STANDARD COMMANDS #
      elsif @@standard_commands.include?(command)
        @@standard_commands.each do |method|
          if command == method
            command.gsub!(/[:.\/]/,'')
            send(command)
          end
        end
      end

    end # end unless
  end # end if locked
end # end method