def increment(n) (n.to_i(36)+1).to_s(36).gsub('0', 'a') end
def passwords(pass) Enumerator.new do |y| loop do pass = increment(pass); y << pass; end end end
def firstReq(n) n.each_char.each_cons(3).select{|a,b,c| a.ord == b.ord-1 && b.ord == c.ord-1 }.size > 0 end
def secondReq(n) (n =~ /i|l|o/) == nil end
def thirdReq(n) (n =~ /(\w)\1.*(\w)\2/) != nil end
def reqs(n) [firstReq(n), secondReq(n), thirdReq(n)] end

puts "Task 1: %s\nTask 2: %s" % passwords('hxbxwxba').lazy.select{ |pass| reqs(pass).all? }.take(2).to_a
