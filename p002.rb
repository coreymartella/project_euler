def p2(n)
  #build up sequence until we hit n
  a = [1,2]
  while a[-2] + a[-1] < n
    a << a[-2] + a[-1]
  end
  a.reduce(0){|sum,i| i % 2 == 0 ? sum + i : sum}
end
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
