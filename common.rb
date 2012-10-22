def prime_factors(n)
  prime_factorization(n).map(&:first)
end
def prime(n)
  return false if n <= 1
  return true if n == 2
  known = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  known.each do |i|
    return true if n == i
    return false if n % i == 0
  end
  j = 101
  top = Math.sqrt(n).ceil
  while j <= top
    return false if n % j == 0
    j+=2
  end
  true
end
def next_prime(n)
  #find the next prime greater than n
  i = n % 2 == 0 ? n + 1 : n + 2
  while true
    return i if prime(i)
    i += 2
  end
end
def prev_prime(n)
  #find the prev prime less than n
  i = n % 2 == 0 ? n - 1 : n - 2
  while true
    return i if prime(i)
    i -= 2
  end
end
def primes(n)
  primes = [2,3,5,7,11,13,17,19]
  next_possible = primes[-1] + 2
  while primes.size < n
    primes << next_possible if prime(next_possible)
    next_possible += 2
  end
  primes[0...n]
end
def prime_factorization(n)
  factors= []
  max_factor = (n*0.5).ceil
  known = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  known.each do |p|
    i = p
    if n % i == 0
      factor_count = 0
      while n % i == 0
        n/=i 
        factor_count += 1
      end
      factors << [i, factor_count]
    end
    break if n == 1
  end
  known.last.step(max_factor,2) do |i|
    if n % i == 0
      factor_count = 0
      while n % i == 0
        n/=i 
        factor_count += 1
      end
      factors << [i, factor_count]
    end
    break if n == 1
  end
  factors << [n,1] if factors.empty?

  factors
end
def num_divisors(n)
  powers = prime_factorization(n).transpose[-1]
  powers.map{|i| i + 1}.reduce(:*)
end
def divisors(n)
  primes, powers = prime_factorization(n).transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |divisor_powers|
    primes.zip(divisor_powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort
end
def proper_divisors(n)
  divisors(n) - [n]
end
def try_p(num,*args)
  load("common.rb" % num) 
  load("p%03d.rb" % num) 
  t = Time.now
  res = send("p#{num}",*args)
  IO.popen('pbcopy', 'r+') { |clipboard| clipboard.print res }
  puts("P#{num}: #{res} in %2.6fs (copied to clipboard)" % (Time.now - t)) 
  res
end
def setup_p(num)
  File.open("p%03d.rb" % num,'w') do |f|
    f.puts "load 'common.rb'"
    f.puts "def p#{num}(n=1)\n  \nend"
  end unless File.exists?("p%03d.rb" % num)
  append_p_desc(num)
end
def append_p_desc(num)
  require 'open-uri'
  require 'rubygems'
  require 'nokogiri'
  doc = Nokogiri::HTML(open("http://projecteuler.net/problem=#{num}"))
  prob = doc.css(".problem_content").text.strip.split(/\r?\n/)
  File.open("p%03d.rb" % num,'a') do |f|
    f.puts "\n"
    f.puts prob.map{|l| "# #{l}"}.join("\n")
  end
end
def num_to_words(n)
  suffixes = %w{ one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}.insert(0,"")
  prefixes = %w{ twenty thirty forty fifty sixty seventy eighty ninety}.insert(0,"").insert(0,"")
  words = ""
  if n > 100
    #for each of the sign
    words << "#{suffixes[n/100]}hundred"
    words << "and" if n % 100 != 0
    n = n % 100
  end
  if n < 20
    words += suffixes[n]
  else
    words += [prefixes[n/10],suffixes[n%10]].compact.join("")
  end
end