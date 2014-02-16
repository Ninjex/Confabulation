def check_mod
  @mods.map{|mod| mod.downcase!}
  @mods.include?(@user_name_first.downcase)
end