load 'common.rb'
def p37(n=1)
  results = []
  p = 10 #we don't consider the single digit primes
  while results.size < 11
    p = next_prime(p)
    p_s = p.to_s
    next if p_s =~ /^1|1$|.5/ #can't start or end with 1, can't have a five beyond the leading digit
    results << p if (1..p_s.size-1).all?{|i| prime(p_s[0...i].to_i) && prime(p_s[i..-1].to_i)}
  end
  puts "results:#{results.inspect}"
  results.reduce(:+)
end

# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
