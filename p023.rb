load 'common.rb'
def p23(n=28123)

  abundants = (1..n).map do |i|
    (proper_divisors(i).reduce(:+) || 0) > i ? i : nil
  end.compact
  # puts "abundants: #{abundants.inspect}"
  odds = abundants.select{|i| i % 2 == 1}
  found = odds.map{|i| }
  sums = {}
  abundants.each do |i|
    abundants.each do |j|
      sums[i + j] = true
      break if i + j > n
    end
  end
  diff = ((1..n).to_a - sums.keys)
  puts "diff: #{diff.inspect}"
  diff.reduce(:+)
end

# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. 
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. 
# However, this upper limit cannot be reduced any further by analysis even though it is known 
# that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
