load 'common.rb'
class P393
  attr_reader :before,:after, :n,:s

  def initialize(n)
    @n = n
    @s = n*n
    @ways = 0
    @before = Array.new(s)
    @after = Array.new(s)
    @sols = []
  end
  def solve
    dfs
    puts @sols.reduce(Hash.new(0)){|h,e| h[e] += 1; h}.inspect
    @ways
  end
  protected
    def dfs(start=0)
      start.upto(@s-1) do |i|
        next if @before[i]

        # y = i/n
        # x = i % n
        #try to move it up
        if i >= n && !@after[i-n] && @before[i-n] != :d
          @before[i] = @after[i-n] = :u
          dfs(i+1)
          @before[i] = @after[i-n] = nil #revert
        end

        #try to move it down
        if i + n < s && !@after[i+n] && @before[i+n] != :u
          @before[i] = @after[i+n] = :d
          dfs(i+1)
          @before[i] = @after[i+n] = nil #revert
        end

        #try to move it left
        if i % n != 0 && !@after[i-1] && @before[i-1] != :r
          @before[i] = @after[i-1] = :l
          dfs(i+1)
          @before[i] = @after[i-1] = nil #revert
        end
        #try to move it right
        if i % n != n - 1 && !@after[i+1] && @before[i+1] != :l
          @before[i] = @after[i+1] = :r
          dfs(i+1)
          @before[i] = @after[i+1] = nil #revert
        end
        break
      end

      #check that everything is moved
      if @after.all?
        moves = [:l,:r,:u,:d].map{|m| @after.count{|m_a| m == m_a}}
        @sols << moves
        @ways += 1 
      end
    end
end
def p393(n=4)
  #do depth first search
  #in an n x n square determine the possible move sequences of all ants.
  #ants in the corner only have 2 possible moves
  P393.new(n).solve
end

# An  nn grid of squares contains  n2 ants, one ant per square.
# All ants decide to move simultaneously to an adjacent square (usually 4 possibilities, except for ants on the edge of the grid or at the corners).
# We define f(n) to be the number of ways this can happen without any ants ending on the same square and without any two ants crossing the same edge between two squares.
# 
# 
# You are given that f(4) = 88.
# Find  f(10).
