def prime(n)
  factors= []
  return false if n % 2 == 0
  3.step((n**0.5).ceil,2) do |i|
    return false if n % i == 0
  end
  true
end

def p7(n)
  primes = [nil,2,3,5,7,11,13]
  while !primes[n]
    #need to fill in primes
    (primes.last+2..primes.last*2).step(2) do |i|
      primes << i if prime(i)
    end
  end
  primes[n]
end