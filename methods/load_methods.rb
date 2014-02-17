@@standard_commands = [] # Create an array for regular user commands
@@mod_commands      = [] # Create an array for moderator commands
@@admin_commands    = [] # Create an array for administrator commands

METHODS   = './methods'
ACCESS    = '/access/'
FUNCTIONS = '/functions/'
access_paths = ["standard/", "mod/", "admin/"]
def parse_access(path)
  Dir["#{METHODS}#{ACCESS}#{path}*.rb"].each do |file|
    require file
    func = file.gsub("#{METHODS}#{ACCESS}#{path}", "")[0..-4]
    if path == "standard/" then @@standard_commands << ":./#{func}" end
    if path == "mod/" then @@mod_commands << ":./#{func}" end
    if path == "admin/" then @@admin_commands << ":./#{func}" end
  end
end
Dir["./methods/functions/*.rb"].each do |file|
  require file
end
access_paths.map{|path| parse_access("#{path}")} # Requires and pushes all functions from /access/*