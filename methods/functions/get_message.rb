def get_message
  text = @input.drop(4) # Grab all data following a command
  p text
  message = text.join(' ')
  message.strip
=begin
  yaml_words = File.read('defined_words.yml')
  defined_words = YAML.load(yaml_words)

  text.each do |check_word| # Each word from the user
    defined_words.each do |word, defi| # The words and definitions
      #new_word = word #"%"+word # Add % to the word to check
      if word == check_word
        # Use bang! here to change it in place
        message.gsub!("#{check_word}", "#{defi}")
      end
    end

  end
=end
  # Be very careful here: strip! will return nil if nothing is stripped
  # message = message.strip! # Remove the trailing whitespace
  # Don't need return in ruby
  # return message # Return the variable
  
  #message.strip
end