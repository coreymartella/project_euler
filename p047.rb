load 'common.rb'
def p47(req=3)
  h = {}
  n = 644
  while true
    if (n-req) % 1000 > n % 1000
      puts n # "#{n-(n%1000)}" if n-(n%1000) == 0 && ((n-4)%1000) > (n%1000)
    end
    h[n] = prime_factorization(n).size
    # puts "#{n} has #{h[n]}"
    if h[n] == req
      #check to see from n-3 to n+3 if we have a subsequence of length 4
      (n-(req-1)..n+(req-1)).reduce(0) do |consecutive,i|
        h[i] ||= prime_factorization(i).size
        # puts "checking #{i} with factors #{h[i]}, found #{consecutive} so far."
        consecutive = (h[i] == req ? consecutive + 1 : 0)
        return i - (req-1) if consecutive == req
        consecutive
      end
    end
    h.clear if h.size > req*2
    n+=req
  end
end

# The first two consecutive numbers to have two distinct prime factors are:
# 14 = 2  715 = 3  5
# The first three consecutive numbers to have three distinct prime factors are:
# 644 = 2²  7  23645 = 3  5  43646 = 2  17  19.
# Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?
