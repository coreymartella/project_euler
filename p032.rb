load 'common.rb'
def p32(n=9)
  max = ((n+1)/2..n).to_a.join.reverse.to_i
  (1..max).reduce(0) do |r,i|
    #no way to be pandigital if theres repeating digits or zeros.
    next r if i.to_s =~ /0|(.).*\1/

    proper_divisors(i).reduce(r) do |r2,d|
      break(r2+i) if "#{i}#{d}#{i/d}" !~ /(.).*\1/ && "#{i}#{d}#{i/d}" =~ /[1-9]{#{n}}/
      r2
    end
  end
end

# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
# 
# The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
# 
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# 
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
