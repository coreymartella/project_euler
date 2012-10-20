load 'common.rb'
def p38
  #we know the answer must start with 9 since 9 and (1,2,3,4,5) gives us 918273645, so the integer must start with a 9 as well.
  i = 9
  max = 0
  #we've hit the end with with n=2 we have more than 9 digits
  while (digits = "#{i}#{i*2}").size <= 9
    n = 2
    while digits.size < 9
      n+=1
      digits << "#{i*n}"
    end
    max = digits.to_i if digits.size == 9 && digits !~ /0|(.).*\1/ && digits.to_i > max
    i+= 1
    if i.to_s !~ /^9/ #only the next digit starting with 9
      i = "9#{(1..i.to_s.size-1).to_a.reverse.join}".to_i
    end
  end
  max
end

# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192  1 = 192
# 192  2 = 384
# 192  3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n  1?
