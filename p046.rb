load 'common.rb'
def p46
  squares = (1..1000).map{|n| n ** 2}
  n = 35
  while true
    n+= 2
    if !prime(n)
      #find a Goldbach decomp of this number.
      return n if squares.all?{|s| !prime(n-2*s)}
    end
  end

end

# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
# 9 = 7 + 212
# 15 = 7 + 222
# 21 = 3 + 232
# 25 = 7 + 232
# 27 = 19 + 222
# 33 = 31 + 212
# It turns out that the conjecture was false.
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
