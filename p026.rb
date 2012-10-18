load 'common.rb'
def p26(n=7)
  max = 0
  result = 2
  (2..n).each do |d|
    q,iters = d.to_s.size * 10, 0
    iters = 0
    cycle = {q/10 => iters}
    begin
      r,q,iters = q % d, (q % d) * 10, iters + 1
      if cycle[r]
        max,result = iters-cycle[r],d if iters-cycle[r] > max
        break
      end
      cycle[r] = iters      
    end while r != 0
  end
  result
end

# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
# 
# 1/2= 0.5
# 1/3= 0.(3)
# 1/4= 0.25
# 1/5= 0.2
# 1/6= 0.1(6)
# 1/7= 0.(142857)
# 1/8= 0.125
# 1/9= 0.(1)
# 1/10= 0.1
# 
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
# http://en.wikipedia.org/wiki/Repeating_decimal
<<-WIKI
           .  .
        0.0675
   74 ) 5.00000
        4.44
          560
          518
           420
           370
            500
etc. Observe that at each step we have a remainder
the successive remainders displayed above are 56, 42, 50.
When we arrive at 50 as the remainder, and bring down the "0", we find ourselves dividing 500 by 74
which is the same problem we began with. Therefore the decimal repeats: 0.0675 675 675

WIKI