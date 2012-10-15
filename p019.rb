load 'common.rb'
def p19(n=1)
  t = Time.parse("Jan 1 1901")
  month_lengths = Hash.new {|h,v|
    if [9,4,6,11].include?(v.month)
      30
    elsif v.month == 2
      v.year % 4 == 0 && (v.year % 100 != 0 || v.year % 400 == 0) ? 29 : 28
    else
      31
    end
  }
  total = 0
  while t.year < 2001
    total += 1 if t.wday == 0
    t += (month_lengths[t]*86400)
  end
  total
end

# You are given the following information, but you may prefer to do some research for yourself.
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
