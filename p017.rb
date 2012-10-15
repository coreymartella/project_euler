load 'common.rb'
def num_to_words(n)
  suffixes = %w{ one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}.insert(0,"")
  prefixes = %w{ twenty thirty forty fifty sixty seventy eighty ninety}.insert(0,"").insert(0,"")
  words = ""
  if n >= 1000
    #for each of the sign
    words << "#{suffixes[n/1000]}thousand"
    words << "and" if n % 100 == 0 && n % 1000 != 0
    n = n % 1000
  end
  if n >= 100
    #for each of the sign
    words << "#{suffixes[n/100]}hundred"
    words << "and" if n % 100 != 0
    n = n % 100
  end
  if n < 20
    words += suffixes[n]
  else
    words += [prefixes[n/10],suffixes[n%10]].compact.join("")
  end
end
def p17(n=1000)
  (1..n).map{|i|num_to_words(i).size}.reduce(:+)
end

# If the numbers 1 to 5 are written out in words: one  two  three  four  five  then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words  how many letters would be used? 
# NOTE: Do not count spaces or hyphens. For example  342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of  and  when writing out numbers is in compliance with British usage.
