load 'common.rb'
def p40
  s,n = "",0
  while s.size < 1E6 #build up the string that has 1000000 digits first.
    s << (n+=1).to_s
  end
  (0..6).reduce(1){|p,e| p*s[10**e - 1].to_i} #reduce the exponents 0 thru 6 as a product
end

# An irrational decimal fraction is created by concatenating the positive integers:
# 0.123456789101112131415161718192021...
# It can be seen that the 12th digit of the fractional part is 1.
# If dn represents the nth digit of the fractional part, find the value of the following expression.
# d1d10d100d1000d10000d100000d1000000
