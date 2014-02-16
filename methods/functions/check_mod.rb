def check_mod
  @mods.each do |mod|
    if mod.downcase == @user_name_first.downcase then return true end
  end
end