load 'common.rb'
def p34(n=1)
  count = 0
  3.upto(10_000_000) do |i|
    # puts "checking: #{i}"
    if i.to_s.chars.map{|c| c == '0' ? 0 : (1..c.to_i).reduce(:*)}.reduce(:+) == i
      puts "found #{i} == #{i.to_s.chars.map{|c| "#{c}!"}.join(" + ")}"
      count += 1
    end
  end
  count
end

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
