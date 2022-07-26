#!/usr/bin/env ruby

matched = ARGV[0].scan(/(\[from:.*?\]|\[to:.*?\]|\[flags:.*?\])/)

res = Array.new

for match in matched do 
   matched_string = match.join
   res.append(matched_string[matched_string.index(':') + 1..-2])
end

puts res.join(',')