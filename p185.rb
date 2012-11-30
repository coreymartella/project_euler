load 'common.rb'
def p185(n=1)
  rules = {
"3041631117224635" => 3,
"1841236454324589" => 3,
"5855462940810587" => 3,
"9742855507068353" => 3,
"4296849643607543" => 3,
"7890971548908067" => 3,
"8690095851526254" => 3,
"1748270476758276" => 3,
"5616185650518293" => 2,
"4513559094146117" => 2,
"2615250744386899" => 2,
"6442889055042768" => 2,
"2326509471271448" => 2,
"5251583379644322" => 2,
"2659862637316867" => 2,
"3847439647293047" => 1,
"3174248439465858" => 1,
"8157356344118483" => 1,
"6375711915077050" => 1,
"6913859173121360" => 1,
"4895722652190306" => 1,
"2321386104303845" => 0,
  }.reduce({}){|h,(k,v)| h.merge(k.split("").map(&:to_i) => v)}
rules5 = {
#39542 is solution.
"90342" => 2,
"70794" => 0,
"39458" => 2,
"34109" => 1,
"51545" => 2,
"12531" => 1,
  }.reduce({}){|h,(k,v)| h.merge(k.split("").map(&:to_i) => v)}
  # P185.new(rules5).solve
  P185.new(rules).solve
end
class P185
  BOLD_ON = "\033[7m"
  BOLD_OFF = "\033[0m"
  attr_accessor :rules, :digits, :sol, :sol_size, :iters, :weighted_rules, :weighted_digits
  def initialize(rules)
    @rules = rules
    @weighted_rules = @rules.keys.sort_by{|rule| -rules[rule]}
    @rules_total = rules.values.reduce(:+)
  end
  def solve
    @digits = Array.new(rules.keys.first.size){{}}

    @sol = Array.new(digits.size)
    @sol_size = 0
    @iters = 0

    #apply all rules with count > 0 to create whitelist of digits
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
      #remove the digits from this rule to the solution set since they can't possibly occur
      rule.each_with_index do |d, i|
        digits[i].delete(d)
      end
    end
    #find a digit to attack, logic is the digits with the fewest possibilities, and tie break by the digit with a number that occurs in the most rules.
    @weighted_digits = (0..digits.size-1).to_a.sort_by{|i| [digits[i].size, -digits[i].values.max, digits[i].values.reduce(:+)]}
    debug
    try_rules
    # rule_combos = choose((0..digits.size-1).to_a, digits.size + 1)
    # # try_digit(0)
    # sol.join
  end
  def choose(rule_indexes, remaining_weight)
    return [[]] if rule_indexes.nil? || rule_indexes.empty? && remaining_weight == 0
    return [] if rule_indexes.nil? || rule_indexes.empty? && k > 0
    return [[]] if n.size > 0 && k == 0
    c2 = n.clone
    c2.pop
    new_element = n.clone.pop
    puts "picked #{new_element} from #{n.inspect}"
    choose(c2, k) + append_all(choose(c2, k-1), new_element)
  end

  def append_all(lists, element)
    lists.map { |l| l << element }
  end
  def try_rules(*args)#(rule_indexes,selected_rules,rules_weight)
    # rule_index = rule_indexes.shift
    # rule = @weighted_rules[rule_index]
    # selected_rules = << rules
    # rule_weight = rules[rules]

    remaining_weight = sol.size + 1
    selected_rules = []
    @weighted_rules.each_with_index do |rule,i|
      c = rules[rule]
      if remaining_weight - c > 0
        #add it to the list
        selected_rules << rule
        remaining_weight -= c
      elsif remaining_weight - c == 0
        #found a package.
        selected_rules << rule
        remaining_weight -= c
        break
      end
    end

    return if remaining_weight != 0

    puts "trying\n#{selected_rules.map{|r| "#{r.join}=#{rules[r]}"}.join("\n")}"
    common_digits = Array.new(rules.keys.first.size){{}}

    selected_rules.each do |rule|
      c = rules[rule]
      next if c == 0
      #add the digits from s to the solution set
      rule.each_with_index do |d, i|
        next if !digits[i][d] #don't include this digit if blacklisted
        common_digits[i][d] ||= 0
        common_digits[i][d] += 1
      end
    end
    puts "common digits:"
    debug common_digits
  end
  def try_digit(digit_index)
    digit = weighted_digits[digit_index]
    options = digits[digit]
    keys = options.keys.sort_by{|k| [-options[k], k]}
    #values = keys.map{|k| options[k]}
    self.sol_size += 1 #for this try we have our current sol + 1 as the size.
    keys.each do |k|
      self.iters += 1
      sol[digit] = k
      print "\r#{sol.map{|d| "%-04s" % (d || "_")}.join}" if @iters % 1000 == 1 && sol.size > 5
      puts "#{sol.map{|d| d || "_"}.join}" % "#{' ' * (sol.compact.size-1)}" if sol.size == 5
      if rule_broken?
        sol[digit] = nil
        next 
      end
      if sol.compact.size < sol.size
        #pick the next digit to solve and descend
        try_digit(digit_index + 1)
      end
      #if the recursion has returned and we have a solution we're good to go.
      return if sol.compact.size == sol.size
    end
    #no solution found for this digit combo, revert
    @sol_size -= 1
    sol[digit] = nil
  end
  def rule_broken?
    #evaulate the rules in the current solution space and see if anything is broken.
    weighted_rules.each do |rule|
      c = rules[rule]
      sol_c = 0
      rule.each_with_index do |d,i|
        sol_c += 1 if d == sol[i]
        return true if sol_c > c
      end
      #if we have a full solution the rule must be exactly matched
      return true if sol_size == sol.size && sol_c != c
    end
    <<-LOGIC
    for the current solution size since rules so that the number of guaratneed digits for the rules gives us at least on digit that must match in 2 rules
    for example if we have 1 digit in a 5 digit solution "guessed" we need rules that add to N + (N - sol_size) + 1 , so 5 + (5-1) + 1 = 9,

    find a set of rules whos weight adds up to N+1 and have only 1 digit in common.
    LOGIC
    false
  end
  def debug(display_digits=digits)
    puts((0..display_digits.size-1).to_a.map{|i| "%-4d" % weighted_digits.index(i)}.join(""))
    puts((0..display_digits.size-1).to_a.map{|i| "%-4d" % i}.join(""))
    lines = display_digits.map(&:size).max
    lines.times do |i|
      line = display_digits.map do |r|
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
