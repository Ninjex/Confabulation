def imgur
  random = rand(2..25)  # Random number we will use to pull a random image from imgur with
  search_for = get_message.gsub(/[^a-zA-Z0-9 ]/, '').gsub(' ', '+')[0..20]  # Remove anything but a-Z0-9 characters, and replace spaces with +
  #chan_send("Searched for: #{search_for}") # If you want to display what is being searched for uncomment this line

  url = 'http://imgur.com/?q='+search_for   # Generating the proper URL to scrap
  content = Nokogiri::HTML(open(url))       # Grab the content
  posts = content.css('img')                # Get content inside <img> tags
  data = posts[random].to_s                 # Convert a random Nokogiri array item to a string for easy manipulation
  
  if data.nil? == false                 # If the item exists         
    initial_split = data.split('&lt;')  # Split the content - Access initial_split[0] for anything relevant
    if initial_split[0].nil? == false   # If the item exists
    
      remove_ftag = initial_split[0].split('<img alt="" src="') # Access remove_ftag[1] for anything relevant
      get_title = remove_ftag[1].split('title="')               # get_title[1]          => The image title
      get_image = remove_ftag[1].split('b.jpg"')                # get_image[0]+".jpg"   => The image link 
      title = get_title[1].to_s                                 # Set the title to variable title
      image = get_image[0].to_s+".jpg"                          # Set the image to the variable image
      send_data = "Image: http:#{image} Title: #{title}"             # Declare the data to be sent
      chan_send("#{send_data}")                                 # Send the data to the user
      
    else # If the item doesn't exist
      chan_send("No results could be found.")
    end  
  else
    chan_send("No results could be found.")
  end
end
