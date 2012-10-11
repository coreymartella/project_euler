def p2(n)
  #build up sequence until we hit n
  a = [1,2]
  while a[-2] + a[-1] < n
    a << a[-2] + a[-1]
  end
  a.reduce(0){|sum,i| i % 2 == 0 ? sum + i : sum}
end