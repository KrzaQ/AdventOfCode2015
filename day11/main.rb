def passwords(pass) Enumerator.new do |y| loop do y << (pass = pass.succ); end end end
def reqs(n) FirstReq =~ n && /i|l|o/ !~ n && n.scan(/(\w)\1/).size > 1 end
FirstReq = Regexp.union (?a..?z).each_cons(3).map(&:join)

puts "Task 1: %s\nTask 2: %s" % passwords('hxbxwxba').lazy.select{ |pass| reqs(pass) }.take(2).to_a
