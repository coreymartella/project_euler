def factors(n)
  factors= []
  if n % 2 == 0
    factors << 2 
    n/=2 while n % 2 == 0
  end
  3.step((n**0.5).ceil,2) do |i|
    factors << i if n % i == 0
    n/=i while n % i == 0
  end
  factors
end
def prime(n)
  factors= []
  return false if n % 2 == 0
  3.step((n**0.5).ceil,2) do |i|
    return false if n % i == 0
  end
  true
end
def try_p(num,*args)
  load("p%03d.rb" % num) 
  send("p#{num}",*args)
end
def setup_p(num)
  File.open("p%03d.rb" % num,'w') do |f|
    f.puts "load 'common.rb'"
    f.puts "def p#{num}(n=1)\n  \nend"
  end unless File.exists?("p%03d.rb" % num)
  append_desc(num)
end
def append_p_desc(num)
  require 'rubygems'
  require 'nokogiri'
  doc = Nokogiri::HTML(open("http://projecteuler.net/problem=#{num}"))
  prob = doc.css(".problem_content").text.strip.split(/\r?\n/)
  File.open("p%03d.rb" % num,'a') do |f|
    f.puts "\n"
    f.puts prob.map{|l| "# #{l}"}.join("\n")
  end

end