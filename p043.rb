load 'common.rb'
def p43(n=1)
  #d[4] must be even (to be divisible by 2)
  #d(8..10) must be divisible by 17, lets find all the 3 digit numbers that are divisble by 17.
  primes = [2,3,5,7,11,13,17]
  sets = []
  primes.each_with_index do |p,i|
    set = []
    n = p
    while n <= 987
      set << ("%03d" % n) if n.to_s !~ /(.).*\1/ #the number itself can't have repeating digits
      n += p
    end
    sets << set
  end
  #now for each set we have an overlap of 2 digits with the next set and prev set
  sets.each_with_index do |set,i|
    if i < sets.size-1
      next_set = sets[i+1]
      set.delete_if{|digits| next_set.all?{|next_digits| digits[1..2] != next_digits[0..1]}}
    end
    if i > 0
      prev_set = sets[i-1]
      set.delete_if{|digits| prev_set.all?{|prev_digits| digits[0..1] != prev_digits[1..2]}}
    end
  end
  res = 0
  #sets 0, 3 and 6 make up digits 2 thru 9 of any possible number. permute all of these combos
  sets[0].each do |i|
    sets[3].each do |j|
      sets[6].each do |k|
        s = "#{i}#{j}#{k}"
        #check if this is a valid number for the other sets
        next if !sets[1].include? s[1..3]
        next if !sets[2].include? s[2..4]
        next if !sets[4].include? s[4..6]
        next if !sets[5].include? s[5..7]
        #find the missing number out of the 10
        missing = (0..9).to_a - s.split("").map(&:to_i).uniq 
        if missing.size == 1 && missing[0] != 0
          res += "#{missing[0]}#{s}".to_i 
        end
      end
    end
  end
  res #sets
end

# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.
