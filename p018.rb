load 'common.rb'
class Node
  attr_accessor :l,:r,:cost,:depth,:l_p,:r_p,:id,:row,:col
  def initialize(row,col)
    @id = "#{row},#{col}"
    @row = row; @col = col
  end
  def to_s
    "<Node #{id} left:#{l ? l.id : :nil} right:#{r ? r.id : :nil} cost:#{cost}>"
  end
  def inspect
    "<Node #{id}>"
  end
  alias_method :to_s, :inspect
end
#DAG Longest path took 0.024846s, for P067 it took 0.065454s
def p18(file="p018.txt")
  graph = File.read(file).split("\n").map{|l| l.split(/\s+/).map(&:to_i)}
  node_rows = []
  (graph.size-1).downto(0) do |i|
    row = graph[i]
    node_row = []
    row.each_with_index{|c,j| node_row << (n = Node.new(i,j)); n.cost = c; n.depth = i+1; n}
    if node_rows[0]
      node_row.each_with_index do |n,n_i|
        n.l = node_rows[0][n_i]
        n.r = node_rows[0][n_i+1]
        node_rows[0][n_i].r_p = n
        node_rows[0][n_i+1].l_p = n
      end
    end
    node_rows.insert(0,node_row)
  end
  root = node_rows[0][0]
  # length_to = array with |V(G)| elements of type int with default value 0

  length_to = Hash.new(0).merge(root => root.cost)
  path_to = {root => "#{root.col}"}
  #   for each vertex v in topOrder(G) do
  node_rows.flatten.each do |node|
    # for each edge (v, w) in E(G) do
    #   if length_to[w] <= length_to[v] + weight(G,(v, w)) then
    #     length_to[w] = length_to[v] + weight(G,(v, w))
    #our "tree" only has lefts and rights
    if node.l && length_to[node.l] < length_to[node] + node.l.cost
      length_to[node.l] = length_to[node] + node.l.cost
      path_to[node.l] = "#{path_to[node]},#{node.l.col}"
    end
    if node.r && length_to[node.r] < length_to[node] + node.r.cost
      length_to[node.r] = length_to[node] + node.r.cost
      path_to[node.r] = "#{path_to[node]},#{node.r.col}"
    end
  end
  max_node = node_rows[-1].max_by{|n| length_to[n]}
  length_to[max_node]
 end


#brute force recursion took 0.044573s
def best_path_rec(graph,path,sum)
  # puts "recursing from #{path.inspect} sum: #{sum}"
  col = path[-1]
  if graph.size > path.size
    next_row = graph[path.size]
    #end of the graph make a call between the 2 best
    sum_l = sum + next_row[col] #sum from left  
    sum_r = sum + next_row[col+1] #sum from right
    #recurse left
    path_l, sum_l = best_path_rec(graph,path + [path[-1]], sum_l)
    #recurse right
    path_r, sum_r = best_path_rec(graph,path + [path[-1]+1], sum_r)
    if sum_l > sum_r
      [path_l, sum_l]
    else
      [path_r, sum_r]
    end
  else
    [path, sum]
  end
end
#ideas for improvements:
# http://en.wikipedia.org/wiki/Longest_path_problem#Weighted_directed_acyclic_graphs this is DAG, infact its a Tree.
# some kind of bottom up approach, where we eliminate branches of the tree
def p18_rec(file="p018.txt")
  graph = File.read(file).split("\n").map{|l| l.split(/\s+/).map(&:to_i)}
  node_rows = []
  (graph.size-1).downto(0) do |i|
    row = graph[i]
  end
  path, sum = best_path_rec(graph,[0], graph[0][0])
end
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
# 37 4
# 2 4 6
# 8 5 9 3
# That is, 3 + 7 + 4 + 9 = 23.
# Find the maximum total from top to bottom of the triangle below:
# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
# NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)
