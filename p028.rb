def p28(n)
  return 1 if n == 1
  #top right corner is     n**2
  #top left corner is      n**2 -  (n-1)
  #bottom left corner is   n**2 - 2(n-1)
  #bottom right corner is  n**2 - 3(n-1)
  #corners at level n are 4(n**2) - 6(n-1)
  level_sum = 4*(n**2) - 6*(n-1)
  return p28(n-2) + level_sum
end