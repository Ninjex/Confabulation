@@standard_command_array = [] # Create an array for regular user commands
@@mod_command_array = [] # Create an array for moderator commands
@@admin_command_array = [] # Create an array for administrator commands
@@regular_commands = 'Regular Commands: '
@@mod_commands = 'Moderator Commands: '
@@admin_commands = 'Administrator Commands: '

METHODS   = './methods'
ACCESS    = '/access/'
FUNCTIONS = '/functions/'
access_paths = ["standard/", "mod/", "admin/"]
def parse_access(path)
  Dir["#{METHODS}#{ACCESS}#{path}*.rb"].each do |file|
    puts "#{file}"
    require file
    func = file.gsub("#{METHODS}#{ACCESS}#{path}", "")[0..-4]
    if path == "standard/" then @@standard_command_array.push(":./" + func) end
    if path == "mod/*.rb" then @@mod_command_array.push(":./" + func) end
  end
end
Dir["./methods/functions/*.rb"].each do |file|
  require file
end
access_paths.map{|path| parse_access("#{path}")} # Requires and pushes all functions from /access/*