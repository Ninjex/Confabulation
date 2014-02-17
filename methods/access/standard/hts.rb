def hts
  user = get_message # Grab the username
  if user =~ /[^a-zA-Z0-9\-_]/ then chan_send("Invalid characters in the username.")
  elsif user.nil? == true # If the user did not submit a username
    chan_send("You must enter a username example: !hts -ninjex-")  
  else # If the user did submit a username
    url = "http://www.hackthissite.org/api/#{user}" # Specify the URL
    content = Nokogiri::HTML(open(url)) # Grab the contents of the URL
    p = content.css('p').to_s # Grab the content inside the <p> css tag
    if p == '<p>User not found</p>' # If the user is not found
      chan_send("Invalid username!") # Tell them it's invalid
    else # If the user is found
      stats = p.split("\n") # Split the content into an array seperated by newlines
      results = stats.map{|category| category.gsub('<p>','').gsub('</p>','')}.join(', ')
      chan_send("#{results}") # Send the data
    end
  end
end