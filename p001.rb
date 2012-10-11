def p1(n)
  (1...n).reduce(0){|sum,i| i % 5 == 0 || i % 3 == 0 ? sum + i : sum}
end
puts p1(1000)