def p9
  1.upto(999) do |i|
    (999-i).downto(i) do |j|
      k = 1000 - i - j
      return i*j*k if i**2 + j**2 == k**2
    end
  end
end