class Graph
 attr_accessor :nodes, :discovered, :solved
 def initialize()
     @nodes = {}
     @discovered = {}
     @solved = {}

 end

 def addNode(value)
   if @node[value].nil?
     @nodes[value] = Node.new(value)
   end

 end

 def removeNode(value)
     node = @nodes.delete(value)
     node.edges = nil
     node
 end

 def addEdge(node_1_id, node_2_id, cost)
   node1 = @nodes[node_1_id]
   node2 = @nodes[node_2_id]
   node1.addEdge(node2, cost)
   node2.addEdge(node1, cost)
 end

 def removeEdge(node_1_id, node_2_id)
   node1 = @nodes[node_1_id]
   node2 = @nodes[node_2_id]
   node1.removeEdge(node2)
   node2.removeEdge(node1)
 end

 def shortest_distance(node_1_id, node_2_id)

 end


 # More methods here

end

class Node
 attr_accessor :id, :value, :edges
 @@counter =0
 def initialize(value)
   @@counter +=1
   @id = @@counter
   @value = value
   @edges = {} # hash to map connected Nodes to the associated cost
 end

 def addEdge(node, cost)
   @edges[node] = cost
 end

 def removeEdge(node)
   @edges.delete(node)
 end

end
