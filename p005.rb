def p5(n)
  divisors = (2..n).to_a
  max = divisors.reduce(:*)
  divisors.reverse.each do |i|
    #factor out divisors as from biggest to smallest
    while divisors.all?{|d| (max/i) % d == 0}
      puts "max still % 0 for all divisors, pulling out #{i}"
      max/=i
    end
  end
  max
end
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
