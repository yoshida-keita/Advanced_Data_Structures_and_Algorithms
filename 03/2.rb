$D = []
$inf = 2147483647
def init(n_)
  n=1
  while(n<n_) do n*=2 end
  0.upto(2*n-1){
    $D<<$inf
  }
end
def update(a,b,k,l,r,x)
  if(r<=a||b<=l)
    return
  end
  if(a<=l&&r<=b)
    $D[k]=x
  else
    if($D[k]!=$inf)
      $D[k*2+1]=$D[k]
      $D[k*2+2]=$D[k]
      $D[k]=$inf
    end
    update(a,b,k*2+1,l,(l+r)/2,x)
    update(a,b,k*2+2,(l+r)/2,r,x)
  end
end
def find(a,b,k,l,r)
  if(r<=a||b<=l)
    return $inf
  end
  if(a<=l&&r<=b)
    return $D[k]
  else
    if($D[k]!=$inf)
      $D[k*2+1]=$D[k]
      $D[k*2+2]=$D[k]
      $D[k]=$inf
    end
    return [find(a,b,k*2+1,l,(l+r)/2),find(a,b,k*2+2,(l+r)/2,r)].min
  end
end

n, q = gets.split.map(&:to_i)
init(n)
q.times{
  u,s,t,x = gets.split.map(&:to_i)
  if(u == 0)
    update(s,t+1,0,0,n,x)
  else
    puts find(s,s+1,0,0,n) if n!=1
    puts $D[0] if n==1
  end
}


