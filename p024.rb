load 'common.rb'
def p24(num_digits=3,perm=4)
  orig_perm = perm
  # perm -= 1 # we're looking for the 0th in our case
  num_permutations = (2..num_digits).inject(:*)
  digits = ('0'.."#{num_digits-1}").to_a
  digit_perms = num_permutations/(num_digits-1)
  (1..num_digits).map do |digit|
    ordinal = (perm-1)/digit_perms
    perm = (perm % digit_perms) + 1
    puts "#{orig_perm}, digit #{digit} using ordinal #{ordinal} (#{digits[ordinal-1]}), remaining perm: #{perm}"
    digits.delete_at(ordinal-1)
  end
end

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
