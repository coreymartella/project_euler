def prime(n)
  factors= []
  return false if n % 2 == 0
  3.step((n**0.5).ceil,2) do |i|
    return false if n % i == 0
  end
  true
end
def next_prime(p)
  start = prime(p) ? p+2 : (p % 2 == 0 ? p + 1 : p)
  (start..start*2).step(2) do |i|
    return i if prime(i)
  end  
end
def p10(n)
  primes = [2,3]
  while primes.last < n
    #need to fill in primes
    primes << next_prime(primes.last)
  end
  primes[0..-2].reduce(:+)
end

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
