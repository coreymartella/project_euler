load 'common.rb'
def p35(n=1_000_000)
  known = [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]  
  p = next_prime(known.last)
  count = known.size
  while p < n
    p_s = p.to_s
    if p_s !~ /[245680]/ && (1..p_s.size-1).all?{|i| prime("#{p_s[i..p_s.size]}#{p_s[0..i-1]}".to_i)}
      count += 1
    end
    p = next_prime(p)
  end
  count
end
#this code returns 73, the actual answer is 55 from http://en.wikipedia.org/wiki/List_of_prime_numbers#Circular_primes, not sure whats up.

# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?
