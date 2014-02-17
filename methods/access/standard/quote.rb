def quote
  quote_number = rand(1..42491).to_s
  url = "http://www.quotationspage.com/quote/#{quote_number}.html"
  content = Nokogiri::HTML(open(url))
  p = content.css('dt').to_s
  result = p.gsub('<dt>','').gsub('</dt>','')
  if result == 'ERROR: No such quotation number.'
    quote
  else
    chan_send("#{result}")
  end
end