def join
  chans = get_message
  all_chans = chans.split(',')
  all_chans.map{|channel| send_data("JOIN #{channel}")}
end