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
    # puts @sols.reduce(Hash.new(0)){|h,e| h[e] += 1; h}.inspect
    @ways
  end
  protected
    def dfs(start=0)
      start.upto(@s-1) do |i|
        next if @before[i]
        moved = false
        # y = i/n
        # x = i % n
        #try to move it up
        if i >= n && !@after[i-n] && @before[i-n] != :d
          moved = true
          @before[i] = @after[i-n] = :u
          dfs(i+1)
          @before[i] = @after[i-n] = nil #revert
        end

        #try to move it down
        if i + n < s && !@after[i+n] && @before[i+n] != :u
          moved = true
          @before[i] = @after[i+n] = :d
          dfs(i+1)
          @before[i] = @after[i+n] = nil #revert
        end

        #try to move it left
        if i % n != 0 && !@after[i-1] && @before[i-1] != :r
          moved = true
          @before[i] = @after[i-1] = :l
          dfs(i+1)
          @before[i] = @after[i-1] = nil #revert
        end
        #try to move it right
        if i % n != n - 1 && !@after[i+1] && @before[i+1] != :l
          moved = true
          @before[i] = @after[i+1] = :r
          dfs(i+1)
          @before[i] = @after[i+1] = nil #revert
        end
        break
      end
      if !moved
        return
      end
      #check that everything is moved
      if @after.all?
        # moves = [:l,:r,:u,:d].map{|m| @after.count{|m_a| m == m_a}}
        # @sols << moves
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
<<-NOTES
i think you need even number because if an ant moves left, another has to move right
10/20/12 8:55 PM: same with up/down
Corey Martella 10/20/12 8:55 PM: not true, if an ant moves right the ant beside it CAN'T move left
Dale Hamill 10/20/12 8:55 PM: no
10/20/12 8:55 PM: not what i mean
10/20/12 8:56 PM: take the whole board....  for every ant moving right, one moves left
Corey Martella 10/20/12 8:56 PM: so you saying for a soln's # of Ls == # of Rs == #of Us == # of Ds ?
Dale Hamill 10/20/12 8:56 PM: otherwise you lose the balance
10/20/12 8:56 PM: that's what im saying
Corey Martella 10/20/12 8:56 PM: lemme see if thats true in n=4.
Dale Hamill 10/20/12 8:57 PM: i call it the Dale Theory of Ant Movement
10/20/12 8:57 PM: DToAM
10/20/12 8:57 PM: for short
Corey Martella 10/20/12 9:00 PM: <annoying teacher you're wrong noise>
10/20/12 9:00 PM: found solution #1, l: 2, r: 2, u: 6, d: 6
found solution #2, l: 3, r: 3, u: 5, d: 5
found solution #3, l: 3, r: 3, u: 5, d: 5
found solution #4, l: 3, r: 3, u: 5, d: 5
found solution #5, l: 4, r: 4, u: 4, d: 4
found solution #6, l: 3, r: 3, u: 5, d: 5
found solution #7, l: 3, r: 3, u: 5, d: 5
found solution #8, l: 4, r: 4, u: 4, d: 4
found solution #9, l: 3, r: 3, u: 5, d: 5
found solution #10, l: 4, r: 4, u: 4, d: 4
found solution #11, l: 5, r: 5, u: 3, d: 3
found solution #12, l: 4, r: 4, u: 4, d: 4
found solution #13, l: 4, r: 4, u: 4, d: 4
found solution #14, l: 4, r: 4, u: 4, d: 4
found solution #15, l: 5, r: 5, u: 3, d: 3
found solution #16, l: 4, r: 4, u: 4, d: 4
found solution #17, l: 3, r: 3, u: 5, d: 5
found solution #18, l: 4, r: 4, u: 4, d: 4
found solution #19, l: 4, r: 4, u: 4, d: 4
found solution #20, l: 5, r: 5, u: 3, d: 3
found solution #21, l: 4, r: 4, u: 4, d: 4
found solution #22, l: 5, r: 5, u: 3, d: 3
found solution #23, l: 4, r: 4, u: 4, d: 4
found solution #24, l: 5, r: 5, u: 3, d: 3
found solution #25, l: 4, r: 4, u: 4, d: 4
found solution #26, l: 5, r: 5, u: 3, d: 3
found solution #27, l: 6, r: 6, u: 2, d: 2
found solution #28, l: 5, r: 5, u: 3, d: 3
found solution #29, l: 5, r: 5, u: 3, d: 3
found solution #30, l: 5, r: 5, u: 3, d: 3
found solution #31, l: 6, r: 6, u: 2, d: 2
found solution #32, l: 2, r: 2, u: 6, d: 6
found solution #33, l: 3, r: 3, u: 5, d: 5
found solution #34, l: 4, r: 4, u: 4, d: 4
found solution #35, l: 3, r: 3, u: 5, d: 5
found solution #36, l: 3, r: 3, u: 5, d: 5
found solution #37, l: 3, r: 3, u: 5, d: 5
found solution #38, l: 4, r: 4, u: 4, d: 4
found solution #39, l: 4, r: 4, u: 4, d: 4
found solution #40, l: 5, r: 5, u: 3, d: 3
found solution #41, l: 4, r: 4, u: 4, d: 4
found solution #42, l: 4, r: 4, u: 4, d: 4
found solution #43, l: 4, r: 4, u: 4, d: 4
found solution #44, l: 5, r: 5, u: 3, d: 3
found solution #45, l: 2, r: 2, u: 6, d: 6
found solution #46, l: 3, r: 3, u: 5, d: 5
found solution #47, l: 3, r: 3, u: 5, d: 5
found solution #48, l: 4, r: 4, u: 4, d: 4
found solution #49, l: 3, r: 3, u: 5, d: 5
found solution #50, l: 4, r: 4, u: 4, d: 4
found solution #51, l: 3, r: 3, u: 5, d: 5
found solution #52, l: 4, r: 4, u: 4, d: 4
found solution #53, l: 5, r: 5, u: 3, d: 3
found solution #54, l: 4, r: 4, u: 4, d: 4
found solution #55, l: 4, r: 4, u: 4, d: 4
found solution #56, l: 4, r: 4, u: 4, d: 4
found solution #57, l: 5, r: 5, u: 3, d: 3
found solution #58, l: 2, r: 2, u: 6, d: 6
found solution #59, l: 3, r: 3, u: 5, d: 5
found solution #60, l: 3, r: 3, u: 5, d: 5
found solution #61, l: 3, r: 3, u: 5, d: 5
found solution #62, l: 4, r: 4, u: 4, d: 4
found solution #63, l: 3, r: 3, u: 5, d: 5
found solution #64, l: 3, r: 3, u: 5, d: 5
found solution #65, l: 4, r: 4, u: 4, d: 4
found solution #66, l: 4, r: 4, u: 4, d: 4
found solution #67, l: 5, r: 5, u: 3, d: 3
found solution #68, l: 4, r: 4, u: 4, d: 4
found solution #69, l: 4, r: 4, u: 4, d: 4
found solution #70, l: 4, r: 4, u: 4, d: 4
found solution #71, l: 5, r: 5, u: 3, d: 3
found solution #72, l: 3, r: 3, u: 5, d: 5
found solution #73, l: 3, r: 3, u: 5, d: 5
found solution #74, l: 4, r: 4, u: 4, d: 4
found solution #75, l: 4, r: 4, u: 4, d: 4
found solution #76, l: 4, r: 4, u: 4, d: 4
found solution #77, l: 5, r: 5, u: 3, d: 3
found solution #78, l: 5, r: 5, u: 3, d: 3
found solution #79, l: 4, r: 4, u: 4, d: 4
found solution #80, l: 4, r: 4, u: 4, d: 4
found solution #81, l: 5, r: 5, u: 3, d: 3
found solution #82, l: 5, r: 5, u: 3, d: 3
found solution #83, l: 6, r: 6, u: 2, d: 2
found solution #84, l: 5, r: 5, u: 3, d: 3
found solution #85, l: 5, r: 5, u: 3, d: 3
found solution #86, l: 5, r: 5, u: 3, d: 3
found solution #87, l: 6, r: 6, u: 2, d: 2
found solution #88, l: 4, r: 4, u: 4, d: 4
10/20/12 9:01 PM: but itis close... l==r && u == d
10/20/12 9:01 PM: && l + r + u + d == n*n
Dale Hamill 10/20/12 9:03 PM: that's what I said
Corey Martella 10/20/12 9:03 PM: oh i thought you meant L == U
Dale Hamill 10/20/12 9:04 PM: no
Corey Martella 10/20/12 9:04 PM: like they were all equal
Dale Hamill 10/20/12 9:04 PM: every left means a right. every up means a down
10/20/12 9:04 PM: ok
10/20/12 9:04 PM: dale wins
10/20/12 9:04 PM: so, i believe the real problem is:  how many rectangles are within the square that don't intersect
10/20/12 9:05 PM: rectangle == a loop
Corey Martella 10/20/12 9:05 PM: mm.. its not just rectangles
10/20/12 9:05 PM: a loop could be a big L
Dale Hamill 10/20/12 9:05 PM: good point
Corey Martella 10/20/12 9:05 PM: or loops within loops whting loops
Dale Hamill 10/20/12 9:05 PM: i was trying to simplify the loop theory
Corey Martella 10/20/12 9:05 PM: i.e the perimeter all goes CW, the inner perim all goes CCW, etc
Dale Hamill 10/20/12 9:06 PM: how about this
Corey Martella 10/20/12 9:06 PM: but wait.
10/20/12 9:06 PM: in the 4x4 case.
10/20/12 9:06 PM: [2, 2, 6, 6]
[2, 2, 6, 6]
[2, 2, 6, 6]
[2, 2, 6, 6]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[3, 3, 5, 5]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[4, 4, 4, 4]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[5, 5, 3, 3]
[6, 6, 2, 2]
[6, 6, 2, 2]
[6, 6, 2, 2]
[6, 6, 2, 2]
10/20/12 9:06 PM: theres all the counts of the LRUDs
Dale Hamill 10/20/12 9:06 PM: sum the tuples
Corey Martella 10/20/12 9:06 PM: notice that its like a nCr
Dale Hamill 10/20/12 9:07 PM: counts of like tupels
Corey Martella 10/20/12 9:07 PM: yeah...
Dale Hamill 10/20/12 9:07 PM: so, part of what we're seeing is that there is symmetry
Corey Martella 10/20/12 9:07 PM: {[2, 2, 6, 6]=>4, [3, 3, 5, 5]=>22, [4, 4, 4, 4]=>36, [5, 5, 3, 3]=>22, [6, 6, 2, 2]=>4}
Dale Hamill 10/20/12 9:08 PM: hm
Corey Martella 10/20/12 9:08 PM: so is it that the outside case (L=2, D=n*2 - 2
10/20/12 9:08 PM: is always == n?
10/20/12 9:09 PM: and the middle case with everything == n
10/20/12 9:09 PM: is always (n*2 -2)*2
10/20/12 9:09 PM: or (n+2)*2
Dale Hamill 10/20/12 9:09 PM: are you certain that youre not counting the same cases more than once in your logic?
Corey Martella 10/20/12 9:09 PM: like in that hash above.
10/20/12 9:09 PM: no, each time theres a sol i put the state of that sol into an array
10/20/12 9:10 PM: that array has size == 88 which is indeed f(4)
Dale Hamill 10/20/12 9:10 PM: so, in 4x4 case.  the 2,2,6,6 is basically two hoops side by side that are 2x4 each
Corey Martella 10/20/12 9:10 PM: sounds right
Dale Hamill 10/20/12 9:10 PM: you can rotate that sideways, but not upside down
10/20/12 9:10 PM: (ie, upside down is hte same solution
10/20/12 9:11 PM: however
10/20/12 9:11 PM: the case where you have a loop that is 2x2 square, and then the rest of the L shape as a second loop...  that one can rotate 4 times
10/20/12 9:11 PM: because it, itself, is not symm
10/20/12 9:11 PM: anyways, no idea if that hleps
Corey Martella 10/20/12 9:12 PM: it does, but enumerating all of those possibilities at 10x10 still seems insane vs coming up with the fomrula for :
10/20/12 9:13 PM: i from 2 up to n-2, # of solutions with [L=i,R-i,U=n*n/2-i,D=n*n/2-i] = ????
10/20/12 9:14 PM: cause the num of sols when you reverse L,R with U,D is equal
10/20/12 9:14 PM: (provided L != U)
10/20/12 9:14 PM: i wonder if doing it for N=6 to get the results form that will yield enough info to build formulas from
Dale Hamill 10/20/12 9:15 PM: yup
Corey Martella 10/20/12 9:15 PM: starting it 
10/20/12 9:15 PM: CPU at 100% already.
Dale Hamill 10/20/12 9:15 PM: yup to the part before that
10/20/12 9:15 PM: but, mayb
10/20/12 9:15 PM: maybe, ya
Corey Martella 10/20/12 9:15 PM: amazing that a 4x4 is solved in 0.03s
10/20/12 9:15 PM: and 6x6 is probably going to take hours
Dale Hamill 10/20/12 9:16 PM: ya
10/20/12 9:16 PM: hm
Corey Martella 10/20/12 9:16 PM: you couldn't definitely paralleize this
10/20/12 9:16 PM: if you have N machines send moves at node i to machine i % n
10/20/12 9:17 PM: couldn't = could
Dale Hamill 10/20/12 9:17 PM: you need to go buy 6 revo's
10/20/12 9:17 PM: NEED TO
Corey Martella 10/20/12 9:17 PM: 1 revo is only like 1/4 of a mbp
Dale Hamill 10/20/12 9:17 PM: hah
Corey Martella 10/20/12 9:17 PM: anyways watching tv with kandy for a bit
Dale Hamill 10/20/12 9:17 PM: yup
10/20/12 9:17 PM: enjoy
Corey Martella 10/20/12 9:17 PM: moving the comp away from us cause the fan is burning
Dale Hamill 10/20/12 9:17 PM: hah
10/20/12 9:17 PM: ilap
10/20/12 9:18 PM: hm
10/20/12 9:18 PM: any loop has to be (even number)x(even number)
10/20/12 9:19 PM: i think
Corey Martella 10/20/12 9:22 PM: 1.9.3-p194 :009 > try_p 393, 6
{[3, 3, 15, 15]=>8, [4, 4, 14, 14]=>184, [5, 5, 13, 13]=>1746, [6, 6, 12, 12]=>8632, [7, 7, 11, 11]=>24344, [8, 8, 10, 10]=>43052, [9, 9, 9, 9]=>51476, [10, 10, 8, 8]=>43052, [11, 11, 7, 7]=>24344, [12, 12, 6, 6]=>8632, [13, 13, 5, 5]=>1746, [14, 14, 4, 4]=>184, [15, 15, 3, 3]=>8}
P393: 207408 in 425.407336s (copied to clipboard)
10/20/12 9:22 PM: that wasn't that bad.
10/20/12 9:22 PM: so interesting there that theres no L=2 or U=2's
10/20/12 9:22 PM: i'll leave that for you to ponder.
Dale Hamill 10/20/12 9:23 PM: sounds like a bug
10/20/12 9:23 PM: haha
10/20/12 9:23 PM: no you won't
10/20/12 9:23 PM: oh wait, ya, that makes sense
10/20/12 9:24 PM: enjoy
10/20/12 9:24 PM: meh, whatever. I'm trying to think about something else. 
Corey Martella 10/20/12 11:33 PM: makes sense that its n/2 cause the best case is you have a bunch of loops that are 2 w and N tall
10/20/12 11:33 PM: so the top of each loop is a L and the bottom is a R
10/20/12 11:33 PM: and the sides are Us and D's
10/20/12 11:33 PM: and you have n/2 of those loops
NOTES
# An  nn grid of squares contains  n2 ants, one ant per square.
# All ants decide to move simultaneously to an adjacent square (usually 4 possibilities, except for ants on the edge of the grid or at the corners).
# We define f(n) to be the number of ways this can happen without any ants ending on the same square and without any two ants crossing the same edge between two squares.
# 
# 
# You are given that f(4) = 88.
# Find  f(10).
