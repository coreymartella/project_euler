load 'common.rb'
def p24(num_digits=3,perm=4)
  num_perms = (2..num_digits).inject(:*)
  digits = ('0'.."#{num_digits-1}").to_a
  (1..num_digits).map do |digit|
    #determine the ordinal of this digit, basically a base num_digits calculation exception the base descreases as we move thru the permutations.
    digit_perms = (num_perms/(num_digits-digit+1))
    ordinal = (perm-1)/digit_perms
    num_perms = num_perms/digit_perms
    puts "at iteration #{digit} perm is #{perm}, choosing ordinal #{ordinal}, remaining perms: #{num_perms}"
    perm = perm % digit_perms#(num_perms/num_digits)
    digits.delete_at(ordinal)
  end.join("")
end

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
