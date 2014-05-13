def join
  chans = get_message
  all_chans = chans.split(',')
  chan_send("Joining: #{all_chans.join(' ')}")
  all_chans.map{|channel| send_data("JOIN #{channel}")}
end