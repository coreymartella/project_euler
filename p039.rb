load 'common.rb'
def p39(n=1)
  #min integral sided triangle is 3,4,5 giving 9+16+25=50
  max_sols = 1
  result = 50

  #find all pythagorean triples with a+b+c <= 1000
  pythag_perims = {25 => true}
  1.upto(1000) do |a|
    1.upto(1000-a) do |b| #could tighen this upper bound to pre-consider c.
      c = Math.sqrt(a**2 + b**2)
      #check if c implies we found a pythag, and make sure its not just a multiple of a previous one gcd(a,b,c) = 1
      pythag_perims[a+b+c.to_i] = true if c.to_i == c && a+b+c <= 1000 && a.gcd(b).gcd(c.to_i) == 1
    end
  end

  51.upto(1000) do |p|
    #p has a pythag-triple solution if its evenally divisable by a pythag-perimeter, since we can scale any pytha triangle by an integer and its still integral
    sols = pythag_perims.keys.select{|k| p % k == 0}.size
    if sols > max_sols
      max_sols = sols
      result = p
    end
  end
  result
end

# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
# {20,48,52}, {24,45,51}, {30,40,50}
# For which value of p  1000, is the number of solutions maximised?
