def check(i)
#  puts "i=#{i}"
#  puts "gs[i]=#{$gs[i]}"
  $gs[i][1] = 1
  $gs[i][0].each{|temp|
#    puts "next_color:#{$gs[temp][1]}"
    if $gs[temp][1] == 1
#      puts "next:#{$gs[temp][1]}"
      $cflag = true
    elsif $gs[temp][1] == 0
      check(temp)
    end
  }
  $gs[i][1] = -1
end

$gs = []
$cflag = false
v,e = gets.split.map(&:to_i)
v.times{
  $gs << [[],0]
}
e.times do
  s,t = gets.split.map(&:to_i)
  $gs[s][0] << t
end
$gs.each_with_index{|g,i|
  if g[1] == 0
    check(i)
  end
}
if $cflag
  puts "1"
else
  puts "0"
end
