load 'common.rb'
def p42(n=1)
  words = File.read("p042.txt").gsub("\"",'').split(",").sort
  max_word_value = 26*words.map(&:size).max
  max_t = max_t_n = 1
  t_n = {1 => 1}
  while max_t_n < max_word_value
    max_t += 1
    t_n[max_t_n = max_t*(max_t+1)/2] = true
  end
  words.reduce(0) do |s,w|
    s + (t_n[w.bytes.map{|c| c - 'A'.bytes.first + 1}.reduce(:+)] ? 1 : 0)
  end
end

# The nth term of the sequence of triangle numbers is given by, tn = 1/2*n*(n+1); so the first ten triangle numbers are:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
