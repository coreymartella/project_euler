load 'common.rb'
def p30(n=5)
  (2..10**(n+1)-1).reduce(0) do |r,i|
    r + (i.to_s.chars.reduce(0){|s,d| s + d.to_i**5} == i ? i : 0)
  end
end

# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
