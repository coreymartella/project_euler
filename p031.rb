load 'common.rb'
def p31(sum=200, denoms=[200, 100,50,20,10,5,2,1])
  #chomp the first one off and recurse into the smaller sum
  coin,denoms = denoms.first, denoms[1..-1]
  (0..sum/coin).reduce(0) do |s,i|
    s + (i*coin == sum ? 1 : 0) + (denoms.any? && sum-coin*i > 0 ? p31(sum-coin*i,denoms) : 0)
  end
end
def p31_brute(sum=200, denoms=[200, 100,50,20,10,5,2,1])
  count = 0
  left = sum
  (0..left/200).each do |a|
    left = 200 - 200*a
    next if left <0
    (0..left/100).each do |b|
      left = 200 - 200*a - 100*b
      next if left <0
      (0..left/50).each do |c|
        left = 200 - 200*a - 100*b - 50*c
        next if left <0
        (0..left/20).each do |d|
          left = 200 - 200*a - 100*b - 50*c - 20*d
          next if left <0
          (0..left/10).each do |e|
            left = 200 - 200*a - 100*b - 50*c - 20*d - 10*e
            next if left <0
            (0..left/5).each do |f|
              left = 200 - 200*a - 100*b - 50*c - 20*d - 10*e - 5*f
              next if left <0
              (0..left/2).each do |g|
                left = 200 - 200*a - 100*b - 50*c - 20*d - 10*e - 5*f - 2*g
                next if left <0
                h = left
                puts "#{a}*200 + #{b}*100 + #{c}*50 + #{d}*20 + #{e}*10 + #{f}*5 + #{g}*2 + #{h}*1 = #{a*200 + b*100 + c*50 + d*20 + e*10 + f*5 + g*2 + h*1}"
                count += 1 #we can fill the left overs with 1c
              end
            end
          end
        end
      end
    end
  end
  count
end

# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?
