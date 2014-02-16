def fruit(text)
  words = text.split(' ')
  words.each_with_index{|word,pos| words[pos] = "\x3#{rand(0..15)}#{word}\x3"}
  message = words.join(' ')
  return message
end