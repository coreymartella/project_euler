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
def p3(n)
  factors(n).last
end