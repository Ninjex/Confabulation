def send_data(s)

  @filter_list = [ # Creating regular experession list of banned and glined phrases.
    %r{Come watch me on my webcam and chat /w me :-\) http://.+:\d+/me\.mpg},
    %r{Speed up your mIRC DCC Transfer by up to 75%.*www\.freewebs\.com/mircupdate/mircspeedup\.exe},
    %r{^http://www\.angelfire\.com/[a-z0-9]+/[a-z0-9]+/[a-z_]+\.jpg <- .*!},
    %r{^FREE PORN: http://free:porn@([0-9]{1,3}\.){3}[0-9]{1,3}:8180$},
    %r{^!login Wasszup!$},
    %r{^!login grrrr yeah baby!$},
    %r{^!packet ([0-9]{1,3}\.){3}[0-9]{1,3} [0-9]{1,15}},
    %r{^!icqpagebomb ([0-9]{1,15} ){2}.+},
    %r{^!pfast [0-9]{1,15} ([0-9]{1,3}\.){3}[0-9]{1,3} [0-9]{1,5}$},
    %r{^!portscan ([0-9]{1,3}\.){3}[0-9]{1,3} [0-9]{1,5} [0-9]{1,5}$},
    %r{^.u(dp)? ([0-9]{1,3}\.){3}[0-9]{1,3} [0-9]{1,15} [0-9]{1,15} [0-9]{1,15}( [0-9])*$},
    %r{^.syn ((([0-9]{1,3}\.){3}[0-9]{1,3})|([a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+\.[a-zA-Z0-9_.-]+)) [0-9]{1,5} [0-9]{1,15} [0-9]{1,15}},
    %r{^porn! porno! http://.+\/sexo\.exe},
    %r{(^wait a minute plz\. i am updating my site|.*my erotic video).*http://.+/erotic(a)?/myvideo\.exe$},
    %r{^STOP SPAM, USE THIS COMMAND: //write nospam \$decode\(.+\) \| \.load -rs nospam \| //mode \$me \+R$},
    %r{^FOR MATRIX 2 DOWNLOAD, USE THIS COMMAND: //write Matrix2 \$decode\(.+=,m\) \| \.load -rs Matrix2 \| //mode \$me \+R$},
    %r{^hey .* to get OPs use this hack in the chan but SHH! //\$decode\(.*,m\) \| \$decode\(.*,m\)$},
    %r{.*(http://jokes\.clubdepeche\.com|http://horny\.69sexy\.net|http://private\.a123sdsdssddddgfg\.com).*},
    %r{C:\\\\WINNT\\\\system32\\\\(notes|videos|xxx|ManualSeduccion|postal|hechizos|images|sex|avril)\.zip},
    %r{http://.+\.lycos\..+/[iy]server[0-9]/[a-z]{4,11}\.(gif|jpg|avi|txt)},
    %r{^Free porn pic.? and movies (www\.sexymovies\.da\.ru|www\.girlporn\.org)},
    %r{^LOL! //echo -a \$\(\$decode\(.+,m\),[0-9]\)$},
    %r{//write \$decode\(.+\|.+load -rs},
    %r{^Want To Be An IRCOp\? Try This New Bug Type: //write \$decode\(.+=.?,m\) \| \.load -rs \$decode\(.+=.?,m\)$},
    %r{^Check this out.*http://www\.pornzapp\.com.*},
    %r{pony}i,
    %r{onionib}i, # Thank you wallshadow for the heads up! <3
  ]

  s.strip! # Remove trailing whitespace
  detected = 0 # Settings a counter to determine if something is in the list
  
  @filter_list.each do |bad| # For every item in the banned list
    bad = Regexp.new bad # Convert the string into regular expression
    if bad =~ s # If we get a match for the string and a regular expression
      detected += 1 # Add one to our counter
      
      puts "ALERT >> [Bad Phrase]: #{s} [From]: #{@user_name_first}" # Send alert to the terminal
      s = "\x034ALERT [Bad Phrase] >> TYPE [GLINE] >>\x03\x033 FROM [#{@user_name_first}]\x03" # Change the text of the string
      
      if @chan.downcase == @nick.downcase # If the channel is a pm with the bot
        @irc.puts("PRIVMSG #{@user_name_first} :> #{s}") # Send the text to the user interacting with the bot in pm
      else
        @irc.puts("PRIVMSG #{@chan} :> #{s}") # Else, we send the text to the channel name instead
      end
    end
  end

  if detected == 0 and s.length <= 350 # If the text length is under 450 characters
    @irc.puts s # Push it through through the socket
    puts "==> #{s}" # Push it to the terminal (stdout)
  elsif detected != 0
    @irc.puts "PRIVMSG #{@chan} :#{s}"
    @irc.puts "PRIVMSG #{@owner} :#{s}"
  else
    @irc.puts "PRIVMSG #{@chan} :\x034> ALERT [SPAM] >> LENGTH [#{s.length}] >>\x03\x033 FROM [#{@user_name_first}]\x03"
    @irc.puts "PRIVMSG #{@owner} :\x034> ALERT [SPAM] >> LENGTH [#{s.length}] >>\x03\x033 FROM [#{@user_name_first}]\x03"
  end
end 