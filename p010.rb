def prime(n)
  factors= []
  return false if n % 2 == 0
  3.step((n**0.5).ceil,2) do |i|
    return false if n % i == 0
  end
  true
end
def next_prime(p)
  (primes.last+2..primes.last*2).step(2) do |i|
    return i if prime(i)
  end  
end
def p10(n)
  primes = [2,3]
  while primes.last < n
    #need to fill in primes
    (primes.last+2..primes.last*2).step(2) do |i|
      primes << i if prime(i)
    end
  end
  primes[0..-2].reduce(:+)
end
