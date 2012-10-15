load 'common.rb'
def p15(n=2)
  <<-NOTES
    .   .   .   .
    .   .   .   .
    .   .   .   . 
    .   .   .   . 

    square of size n*n has how many paths from top right to bottom left.
    
    all paths of are length 2n since we have to traverse the width and height.

    We can look at any path as a progression from the diagonal slices of the square or "levels"
    
    when we're on bottom or right edge (i == n or j == n) we only have 1 choice, otherwise we have 2. This doesn't happen until the 2nd half of the path.
    
    so for the first n (0 thru n-1) choices we always have 2 choices (down and right), at level l for l < n there are l nodes. so there are 2 * l choices at level l

    so the first half of the path has 2*1 + 2*2 + 2*3... 

    or in general: i = 0 to n-1 sum of 2 * (i+1)
    
    for the last half of the path (from n to 2n) we have either 1 or 2 choices from each point

    the last position     (l = 2n - 1) has 2 nodes each with only 1 choice. so 2 possible paths from level 2n-1
    the 2nd last position (l = 2n - 2) has 3 nodes, 1 with 2 choices and 2 with 1 choice so 4 possible paths from level 2n-2
    the 3rd last position (l = 2n - 3) has 4 nodes, 2 with 2 choices, and 2 with 1 choice so 6 possible paths from level 2n-3

    in general when at level l for l = n to 2n - 1 we have 2n - 1 - l nodes with 2 choices and 2 nodes with 1 choice.
    so for level l the number of choices 2 + 2((2n - 1) - l - 1)
    so the last half of the path has the sum of choices at level l for l = n to 2n-1

    once we're at level n, or the center diagonal of the square, choices become limited.



    RETHINK.. treat the square like 2 triangles. getting to the bottom of the first triangle is the first half. 

    number of paths to node i,j is for i <= n
      i == 0: paths(i, j-1) since we must of come from i,j-1
      j == 0: paths(i-1, j) since we must of come from i-1,j
      else: paths(i-1,j) + paths(i,j-1) since we could have come from either

    how many paths are there to the nodes of the first triangle?
      1
      1   1
      1   2   1
      1   3   3   1
  NOTES
  paths = [[1]]
  
  1.upto(2*n) do |l|
    nodes = l <= n ? l+1 : 2*n - l + 1
    puts "level #{l} has #{nodes} nodes"
    prev_level = paths[l-1]
    level = []
    #we're at level l, which is all i,j such that i+j = l
    0.upto(nodes-1) do |j|
      puts "doing #{l},#{j}"
      if j == 0 && l <= n #left most, most of come from left most
        level[j] = prev_level[j]
      elsif j == l && l <= n #right most most of come from right most
        level[j] = prev_level[j-1]
      elsif l <=n #could have come from left (j-1) or right (j)
        level[j] = prev_level[j] + prev_level[j-1]
      else# l > n #could have come from left (j) or right (j+1)
        level[j] = prev_level[j] + prev_level[j+1]
      end
    end
    paths[l] = level
  end
  puts paths[-1].inspect
  paths[-1][0]
end

# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
# 
# 
# How many routes are there through a 20x20 grid?
