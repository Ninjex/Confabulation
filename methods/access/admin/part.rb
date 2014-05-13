def part
  chans = get_message
  all_chans = chans.split(',')
  chan_send("Parting: #{all_chans.join(' ')}")
  all_chans.map{|channel| send_data("PART #{channel}, #{@user_name_first} made me do it...")}
end