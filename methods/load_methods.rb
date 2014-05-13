FILE_PATHS      = {} # Create a hash to keep full path locations
STANDARD        = [] # Create an array for regular user commands
MODERATOR       = [] # Create an array for moderator commands
ADMINISTRATOR   = [] # Create an array for administrator commands

METHODS   = './methods'
ACCESS    = '/access/'
FUNCTIONS = '/functions/'
access_paths = ["standard/", "mod/", "admin/"]
def parse_access(path)
  Dir["#{METHODS}#{ACCESS}#{path}*.rb"].each do |file|
    load file #require file
    func = file.gsub("#{METHODS}#{ACCESS}#{path}", "")[0..-4]
    FILE_PATHS[func] = file
    if path == "standard/" then STANDARD << ":./#{func}" end
    if path == "mod/" then MODERATOR << ":./#{func}" end
    if path == "admin/" then ADMINISTRATOR << ":./#{func}" end
  end
end
Dir["./methods/functions/*.rb"].each do |file|
  load file #require file
end
access_paths.map{|path| parse_access("#{path}")} # Requires and pushes all functions from /access/*