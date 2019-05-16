n,q = gets.split.map(&:to_i)
as = Array.new(n,2**31-1)
q.times{|i|
  com, x, y = gets.split.map(&:to_i)
  com == 0 ? as[x] = y : (puts as[x..y].min)
}
