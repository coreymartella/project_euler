def p4(n)
  max = ("9"*n).to_i
  min = ("1" + "0"*(n-1)).to_i
  r = 0
  max.downto(min) do |i|
    max.dowtow(min) do |j|
      p = i*j
      if p.to_s == p.to_s.reverse && p > r
        r = p  
        break
      end
    end
    break if r && r/i > max #stop searching if the r we have can't be bigger
  end
  r
end
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.
