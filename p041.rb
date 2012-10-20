load 'common.rb'
def p41
  p = 7654322 #9 and 8 digit pandigitals won't be prime because their digits sum to 36 and 45 which are both divisible by 3. (http://www.pseudorandom.co.uk/2002/maths/divby9/)
  while true
    p = prev_prime(p)
    return p if p !~ /0|(.).*\1/ && p.to_s.split("").map(&:to_i).sort == (1..p.to_s.size).to_a
  end
end

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?
