# Let's not clutter up constructor.rb with this mess
def user_array
  @full_user = @input[0]                          #=> array[:Ninjex!bounces@HTS-ED9DAF7A.kphservices.com]
  @user_array = @full_user.split('@')             #=> array[:Ninjex!bounces, HTS-ED9DAF7A.kphservices.com]
  @user_name_array = @user_array[0].split('!')    #=> array[:Ninjex, bounces]
  @user_name_first = @user_name_array[0][1..-1]   #=> array[Ninjex]
  @user_name_second = @user_name_array[1]         #=> array[bounces]
  @user_host = @user_array[1]                     #=> array[HTS-ED9DAF7A.kphservices.com]
end