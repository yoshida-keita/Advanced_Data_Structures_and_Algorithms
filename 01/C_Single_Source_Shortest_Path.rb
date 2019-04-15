class V
  attr_accessor :edges, :cost
  def initialize()
    @cost = Float::INFINITY
    @edges = []
  end
  def add_edge(edge)
    @edges << edge
  end
  def show_edges
    puts @edges.join(" ")
  end
end
vn,e,r = gets.split.map(&:to_i)
$vs = []
vn.times{|i|
  $vs << V.new()
}
$glay = []
$black = []
edges = []
e.times do
  s,t,c = gets.split.map(&:to_i)
  $vs[s].add_edge([s,t,c])
  edges << [s,t,c]
end
$vs[r].cost = 0
queue = $vs
loop do
  flag = true
  edges.each{|edge|
    src = edge[0]
    dst = edge[1]
    cos = edge[2]
    next if $vs[src] == Float::INFINITY
    if $vs[dst].cost > cos + $vs[src].cost
      $vs[dst].cost =  cos + $vs[src].cost
      flag = false
    end
  }
  break if flag
end
$vs.each{|v| puts v.cost==Float::INFINITY ? "INF" : v.cost}
