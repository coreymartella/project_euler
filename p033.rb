load 'common.rb'
def p33
  p_n = p_d = 1
  (11..99).each do |n| n_s = n.to_s; next if n_s =~ /(.)\1|0/
    (n+1..99).each do |d| d_s = d.to_s; next if d_s =~ /(.)\1|0/
      #zeros don't count, must have a common digit
      next if !(dupe = (n_s.split('') & d_s.split(''))[0])
      
      if n.to_f/d == n_s.sub(dupe,'').to_f/d_s.sub(dupe,'').to_i
        p_d *= d
        p_n *= n
      end
    end
  end
  p_d/p_d.gcd(p_n)
end

# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
