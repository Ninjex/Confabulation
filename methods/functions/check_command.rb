# This script will check the the variable command input[3], and see if it has a match for a function
# If it finds a match, it will execute the command.
# Note that we search the arrays from functions.rb and restrict access appropriately
# If the bot is on lockdown mode, let the user know and don't pass functions; unless it's the admin
def check_ban # add code here (or under /function to check if a user is banned)
  false
end

def check_command(command)
  restrict = [@nick, 'NickServ', 'ChanServ', 'IRC', 'ING', 'PING'] # Things to not check auth on

  # Don't attempt to check the command if it's the server, nickserv, PING, etc
  unless @user_name_first.include?(':') or @user_name_first.include?('.') or restrict.include?(@user_name_first)
    if MODERATOR.include?(command) or ADMINISTRATOR.include?(command) or STANDARD.include?(command)
      if @lock == :locked && (@user_name_first.downcase != @owner.downcase || MODERATOR.include?(@user_name_first.downcase) == false)
        chan_send("Sorry #{@user_name_first}, I am currently locked (Probably for maintenance). Only #{@owner} may initiate commands at this time.")        
      else
        # ITERATE OVER MOD COMMANDS AND AUTH #
        if MODERATOR.include?(command)
          check_auth(@user_name_first)
          if check_mod == true and @auth == :authenticated
            MODERATOR.each do |method|
              if command == method
                command.gsub!(/[:.\/]/,'')
                load FILE_PATHS[command] if FILE_PATHS.include?(command) ### DOES IT WORK?
                send(command)
              end
            end
          else
            chan_send("You are not authorized for this command!")
          end

        # ITERATE OVER ADMIN COMMANDS AND AUTH #
        elsif ADMINISTRATOR.include?(command)
          check_auth(@user_name_first)
          if @user_name_first.downcase == @owner.downcase and @auth == :authenticated
            ADMINISTRATOR.each do |method|
              if command == method
                command.gsub!(/[:.\/]/,'')
                load FILE_PATHS[command] if FILE_PATHS.include?(command) ### DOES IT WORK?
                send(command)
              end
            end
          else
            chan_send("You are not authorized for this command!")
          end

        # ITERATE OVER STANDARD COMMANDS #
        elsif STANDARD.include?(command)
          STANDARD.each do |method|
            if command == method
              command.gsub!(/[:.\/]/,'')
              load FILE_PATHS[command] if FILE_PATHS.include?(command) ### DOES IT WORK?
              send(command)
            end
          end
        end

      end # end if locked
    end # end if command == method
  end # unless
end # end method