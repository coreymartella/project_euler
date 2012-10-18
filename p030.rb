load 'common.rb'
def p30(n=5)
  (1..10**(n+1)-1).map do |i|
    digits = i.to_s.split("").map{|d| d.to_i ** 5}.reduce(:+)
    digits == i ? i : 0
  end.reduce(:+)
end

# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
