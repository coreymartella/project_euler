load 'common.rb'
def p49(n=1)
  1000.upto(9999) do |d|
    1000.upto(9999) do |i|
      if i != 1487 && prime(i) && prime(i+d) && prime(i+d+d)
        j = i+d
        k = j+d
        i_d = i.to_s.chars.map(&:to_i).sort
        j_d = j.to_s.chars.map(&:to_i).sort
        k_d = k.to_s.chars.map(&:to_i).sort
        return "#{i}#{j}#{k}" if  i_d == j_d && j_d == k_d
      end
    end
  end  
end

# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
# What 12-digit number do you form by concatenating the three terms in this sequence?
