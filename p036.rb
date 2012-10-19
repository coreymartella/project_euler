load 'common.rb'
def p36(n=1_000_000)
  #for it to be a palidrome in base 2 it must end in 1 ==> odds only.
  (1..n).map{|i|i.to_s == i.to_s.reverse && i.to_s(2) == i.to_s(2).reverse ? i : 0}.reduce(:+)
end

# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)
