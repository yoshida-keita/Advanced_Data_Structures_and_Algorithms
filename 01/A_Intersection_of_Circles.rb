cx1, cy1, r1 = gets.split.map(&:to_i)
cx2, cy2, r2 = gets.split.map(&:to_i)
d = (((cx1-cx2).abs)**2 + ((cy1-cy2).abs)**2)**(1/2.0)

if d > r1 + r2
  puts "4"
elsif d == r1+ r2
  puts "3"
elsif (r1-r2).abs < d && r1+r2
  puts "2"
elsif (r1-r2).abs == d
  puts "1"
elsif d < (r1 - r2).abs
  puts "0"
end
