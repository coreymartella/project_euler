def p6(n)
  sum_of_squares = (1..n).reduce{|m,i| m + i**2}
  square_of_sum = (1..n).reduce(:+)**2
  square_of_sum - sum_of_squares
end