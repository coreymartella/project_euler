def p9
  1.upto(999) do |i|
    (999-i).downto(i) do |j|
      k = 1000 - i - j
      return i*j*k if i**2 + j**2 == k**2
    end
  end
end
# A Pythagorean triplet is a set of three natural numbers, a b c, for which,
#  a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product abc.
