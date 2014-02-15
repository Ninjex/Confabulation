def check_mod
  @mods.each do |mod|
    if mod == @user_name_first then return true end
  end
end