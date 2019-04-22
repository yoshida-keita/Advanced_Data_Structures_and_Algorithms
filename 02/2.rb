class Node
  attr_accessor :next, :cost
  def initialize(i)
    @next=i
    @cost=0
  end
end

def cal_cost(x)
  temp = x
  cost = 0
  while temp != $nodes[temp].next
    cost += $nodes[temp].cost
    temp = $nodes[temp].next
  end
  return [temp,cost]
end

n,q = gets.split.map(&:to_i)
$nodes = []
n.times{|i| $nodes << Node.new(i)}

q.times{
  com, x, y, z = gets.split.map(&:to_i)
  tempx, costx = cal_cost(x)
  tempy, costy = cal_cost(y)
  if com == 0
    if tempx != tempy
      if tempx < tempy
        $nodes[tempy].next = tempx
        $nodes[tempy].cost = costx - costy + z
      else
        $nodes[tempx].next = tempy
        $nodes[tempx].cost = costy - costx - z
      end
    end
#    $nodes.each_with_index{|node,i| puts "id:#{i} next:#{node.next} cost:#{node.cost}"}
#    puts
  elsif com == 1
#    $nodes.each_with_index{|node,i| puts "id:#{i} next:#{node.next} cost:#{node.cost}"}
#    puts
    puts tempx != tempy ? "?" : costy-costx
  end
}
