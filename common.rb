def factors(n)
  factors= []
  if n % 2 == 0
    factors << 2 
    n/=2 while n % 2 == 0
  end
  3.step((n**0.5).ceil,2) do |i|
    factors << i if n % i == 0
    n/=i while n % i == 0
  end
  factors
end
def prime(n)
  factors= []
  return false if n % 2 == 0
  3.step((n**0.5).ceil,2) do |i|
    return false if n % i == 0
  end
  true
end
def try_p(num,*args)
  load("p%03d.rb" % num) 
  send("p#{num}",*args)
end