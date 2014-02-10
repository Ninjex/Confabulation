# This script will check the the variable command input[3], and see if it has a match for a function
# If it finds a match, it will execute the command.
# Note that we search the arrays from functions.rb and restrict access appropriately
# If the bot is on lockdown mode, let the user know and don't pass functions; unless it's the admin
def check_ban
  false
end

def check_command(command)
  puts "Checking command: #{command} with values: #{p @@standard_command_array}"
    @@standard_command_array.each do |method| # For every item inside the command_array (from require function)
      puts "Comparing command: #{command} to Method: #{method}"
      if command == method # If we get a match for a command
        if @locked == true and @full_user != @admin
          chan_send("Sorry, #{@user_name_first}, I am currently locked (Probably for maintenance)")
        else
          if check_ban == true # If the user is banned
            chan_send("Sorry, #{@user_name_first} I don't listen to idiots.") # Give an error message, and don't execute the command
          else # If the user is not banned
            command.gsub!(/[:.\/]/, '') #command.slice!(0..1).chomp # Remove the :! from the command variable
            puts "Command now equals: #{command}"
            send(command) # Call command variable as a function
          end
        end
      end
    end
    
    @@mod_command_array.each do |method|
      if command == method
        if @locked == true and @full_user != @admin
          chan_send("Sorry, #{@user_name_first}, I am currently locked (Probably for maintenance)")
        else
          if check_ban == true
            chan_send("Sorry, #{@user_name_first} I don't listen to idiots.")
          else
            mod = check_mod
            if @full_user == @admin or mod == true
              command.gsub!(/[:.\/]/,'') #command.slice!(0..1)
              send(command)
            else
              chan_send("Sorry, #{@user_name_first} you are not authorized to use this command.")
            end
          end
        end
      end
    end
  
    @@admin_command_array.each do |method|
      if command == method
        if @locked == true and @full_user != @admin
          chan_send("Sorry, #{@user_name_first}, I am currently locked (Probably for maintenance)")
        else
          if check_ban == true
            chan_send("Sorry, #{@user_name_first}, I don't listen to idiots.")
          else
            if @full_user == @admin
              command.gsub!(/[:.\/]/,'') #command.slice!(0..1)
              send(command)
            else
              chan_send("Sorry, #{@user_name_first} only the administrator is authorized for this command.")
            end
          end
        end
      end
    end
end