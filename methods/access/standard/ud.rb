def ud
  word = get_message.gsub(/[^[:alpha:],0-9\/-]/, '').gsub('/','%2F')
  url = "http://www.urbandictionary.com/define.php?term=#{word}"
  content = Nokogiri::HTML(open(url))
  p = content.css('div.meaning').text
  results = p.split("\n").compact.reject(&:empty?)

  num_of_results = results.size
  if num_of_results < 1 || results.empty?
    chan_send("The word: #{word} is not defined!")
  else
    result = results[rand(0..num_of_results - 1)] # Random result from the array of results
    if result.nil? == false
      chan_send(result)
    else
      chan_send("Empty result returned for: #{word}")
    end
  end
end