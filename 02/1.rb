def makeSet(x)
  $ps << x
  $rank << 0
end
def union(x,y)
  link(findSet(x), findSet(y))
end
def link(x,y)
  if $rank[x] > $rank[y]
    $ps[y] = x
  else
    $ps[x] = y
    if $rank[x] == $rank[y]
      $rank[y] = $rank[y] + 1
    end
  end
end
def findSet(x)
  if x != $ps[x]
    $ps[x] = findSet($ps[x])
  end
  return $ps[x]
end
$ps = []
$rank = []

n,q = gets.split.map(&:to_i)
n.times{|i|
  makeSet(i)
}
q.times{|i|
  com, x, y = gets.split.map(&:to_i)
  if com == 0
    union(x,y)
  elsif com == 1
    puts findSet(x) == findSet(y) ? "1" : "0"
  end
}
