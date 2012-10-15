load 'common.rb'
def p14(n=1)
  result = 2
  #chain of n to chain size
  results = {2 => 2, 4 => 3}
  max_chain_size = 2
  5.upto(1_000_000) do |i|
    chain = [i]
    chain_size = nil
    while chain[-1] != 1
      next_chain = chain[-1] % 2 == 0 ? chain[-1]/2 : chain[-1]*3 + 1
      if results[next_chain]
        chain_size = results[next_chain] + chain.size
        break
      else
        chain << next_chain
      end
    end
    chain_size ||= chain.size
    results[i] = chain_size
    if chain_size > max_chain_size
      result = i
      max_chain_size = chain_size
    end
  end
  puts "#{result} has chain length #{max_chain_size}"
  result
end

#Brute force took 22s, optimized with lenghts of previous chains took 3s

# The following iterative sequence is defined for the set of positive integers:
# n n/2 (n is even)n  3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.
