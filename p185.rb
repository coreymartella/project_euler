load 'common.rb'
def p185(n=1)
  rules = {
"5616185650518293" => 2,
"3847439647293047" => 1,
"5855462940810587" => 3,
"9742855507068353" => 3,
"4296849643607543" => 3,
"3174248439465858" => 1,
"4513559094146117" => 2,
"7890971548908067" => 3,
"8157356344118483" => 1,
"2615250744386899" => 2,
"8690095851526254" => 3,
"6375711915077050" => 1,
"6913859173121360" => 1,
"6442889055042768" => 2,
"2321386104303845" => 0,
"2326509471271448" => 2,
"5251583379644322" => 2,
"1748270476758276" => 3,
"4895722652190306" => 1,
"3041631117224635" => 3,
"1841236454324589" => 3,
"2659862637316867" => 2,
  }.reduce({}){|h,(k,v)| h.merge(k.split("").map(&:to_i) => v)}
rules5 = {
"90342" => 2,
"70794" => 0,
"39458" => 2,
"34109" => 1,
"51545" => 2,
"12531" => 1,
  }.reduce({}){|h,(k,v)| h.merge(k.split("").map(&:to_i) => v)}
  P185.new(rules).solve
end
class P185
  BOLD_ON = "\033[7m"
  BOLD_OFF = "\033[0m"
  attr_accessor :rules, :digits, :sol
  def initialize(rules)
    @rules = rules
  end
  def solve
    self.digits = Array.new(rules.keys.first.size){{}}
    #apply all 0 rules to remove digits
    max_occurs = 0
    max_indexes = nil
    rules.each do |rule, c|
      next if c == 0
      #add the digits from s to the solution set
      rule.each_with_index do |d, i|
        digits[i][d] ||= 0
        digits[i][d] += 1
      end
    end
    rules.each do |rule, c|
      next unless c == 0
      #remove the digits from s to the solution set
      rule.each_with_index do |d, i|
        digits[i].delete(d)
      end
    end
    digits.each_with_index do |h,i|
      h.each do |d,c|
        if c > max_occurs
          max_occurs = c
          max_indexes = [i,d]
        end
      end
    end
    #now find a rule with 1 and try it.
    self.sol = Array.new(digits.size)
    #find a digit to attack
    digit = (0..digits.size-1).to_a.min_by{|i| [digits[i].size, -digits[i].values.max]}
    try_digit(digit)
    sol.join
  end
  def try_digit(digit)
    options = digits[digit]
    keys = options.keys.sort_by{|k| [-options[k], k]}
    #values = keys.map{|k| options[k]}
    keys.each do |k|
      sol[digit] = k
      print "%-32s #{sol.map{|d| d || "*"}.join}" % "#{' ' * (sol.compact.size-1)}trying"
      if res = rule_broken
        sol[digit] = nil
        next 
      end
      puts ""
      if sol.compact.size < sol.size
        #pick the next digit to solve and descend. based off not already having a solution for the digit and that digit having the least possible slots
        next_digit = (0..digits.size-1).to_a.min_by{|i| [sol[i] ? 1 : 0, digits[i].size, -digits[i].values.max]}
        try_digit(next_digit)
      end
      return 
    end
    #no solution found for this digit combo, revert
    sol[digit] = nil
  end
  def rule_broken
    #evaulate the rules in the current solution space and see if anything is broken.
    rules.each do |rule,c|
      sol_c = 0
      rule.each_with_index do |d,i|
        sol_c += 1 if d == sol[i]
      end
      if sol_c > c #no way its a solution if we've filled more than the rule accounts for.
        puts "..broken by #{rule.map_with_index{|d,i| sol[i] == d ? "#{BOLD_ON}#{d}#{BOLD_OFF}" : d}.join}=#{c}"
        return rule 
      end
    end
    false
  end
  def debug
    lines = digits.map(&:size).max
    lines.times do |i|
      line = digits.map do |r|
        keys = r.keys.sort_by{|k| [-r[k], k]}
        values = keys.map{|k| r[k]}
        if keys[i] && values[i] > 1
          "#{keys[i]}*#{values[i]}"
        elsif keys[i]
          "#{keys[i]}  "
        else
          "   "
        end
      end.join(" ")
      puts line
    end
  end
end
# The game Number Mind is a variant of the well known game Master Mind.
# Instead of coloured pegs, you have to guess a secret sequence of digits. After each guess you're only told in how many places you've guessed the correct digit. So, if the sequence was 1234 and you guessed 2036, you'd be told that you have one correct digit; however, you would NOT be told that you also have another digit in the wrong place.
# 
# For instance, given the following guesses for a 5-digit secret sequence,
# 90342 ;2 correct
# 70794 ;0 correct
# 39458 ;2 correct
# 34109 ;1 correct
# 51545 ;2 correct
# 12531 ;1 correct
# The correct sequence 39542 is unique.
# 
# Based on the following guesses,
# 
# 5616185650518293 ;2 correct
# 3847439647293047 ;1 correct
# 5855462940810587 ;3 correct
# 9742855507068353 ;3 correct
# 4296849643607543 ;3 correct
# 3174248439465858 ;1 correct
# 4513559094146117 ;2 correct
# 7890971548908067 ;3 correct
# 8157356344118483 ;1 correct
# 2615250744386899 ;2 correct
# 8690095851526254 ;3 correct
# 6375711915077050 ;1 correct
# 6913859173121360 ;1 correct
# 6442889055042768 ;2 correct
# 2321386104303845 ;0 correct
# 2326509471271448 ;2 correct
# 5251583379644322 ;2 correct
# 1748270476758276 ;3 correct
# 4895722652190306 ;1 correct
# 3041631117224635 ;3 correct
# 1841236454324589 ;3 correct
# 2659862637316867 ;2 correct
# 
# Find the unique 16-digit secret sequence.
