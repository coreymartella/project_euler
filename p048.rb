load 'common.rb'
def p48(n=10)
  (1..n).reduce(0) do |s,i|
    s + i**i
  end.to_s[-10..-1]
end

# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.
