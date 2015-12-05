T = File.read('data.txt').lines
puts 'Task 1: %s' % T.select{|l| /(?:[aeuio].*){3}/ =~ l}.select{|l| /(.)\1/ =~ l}.reject{|l| /ab|cd|pq|xy/ =~ l}.count
puts 'Task 2: %s' % T.select{|l| /(..).*\1/ =~ l}.select{|l| /(.).\1/ =~ l}.count