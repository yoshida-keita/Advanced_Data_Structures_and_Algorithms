def cro(a,b,c)
  x1 = b[0]-a[0]
  y1 = b[1]-a[1]
  x2 = c[0]-a[0]
  y2 = c[1]-a[1]
  return x1*y2 - x2*y1
end

n = gets.to_i;
xmin = 10000
ymin = 10000
s=[]
n.times{s << gets.split.map(&:to_f)}
s = s.sort_by {|x| [x[0], x[1]]}
temp = s.sort_by {|x| [x[1], x[0]]}
#puts temp.join(" ")
#puts s.join(" ")
u=[]; u << s[0]; u << s[1]
l=[]; l << s[-1]; l << s[-2]

for i in 2..(s.size-1) do
  (u.size).downto(2){|n|
#    puts "u"
#    puts u[n-2].join(" ")
#    puts u[n-1].join(" ")
    break if !(n>=2 && cro(u[n-2], u[n-1], s[i]) > 0)
    u.pop
  }
#  puts "s"
#  puts s[i].join(" ")
  u << s[i]
end

(s.size-3).downto(0){|i|
  (l.size).downto(1){|n|
    break if !(n >= 2 && cro(l[n-2], l[n-1], s[i]) > 0)
#    puts "i:#{i} n:#{n}"
    l.pop
  }
  l << s[i]
}

ans = (u+l).uniq.reverse
puts ans.size
while ans[0] != temp[0]
  ans.push(ans.shift)
end
ans.each{|a|
  puts a.map(&:to_i).join(" ")
}
