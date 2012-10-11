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