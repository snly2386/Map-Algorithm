class Graph
 attr_accessor :nodes, :discovered, :solved
 def initialize()
     @nodes = {}
     @discovered = {}
     @solved = {}
     @costs = {}

 end

 def addNode(value)
   if @nodes[value].nil?
     @nodes[value] = Node.new(value)
   end

 end

 def removeNode(value)
     node = @nodes.delete(value)
     node.edges = nil
     node
 end

 def addEdge(node1_value, node2_value, cost)
   @nodes[node1_value].addEdge(@nodes[node2_value], cost)
   @nodes[node2_value].addEdge(@nodes[node1_value], cost)
 end

 def removeEdge(node_1value, node_2value)
   node1 = @nodes[node_1value]
   node2 = @nodes[node_2value]
   node1.removeEdge(node2)
   node2.removeEdge(node1)
 end

 def djikstra_algorithm(start_node, finish_node)
    
    @nodes.each do |node, value|
      @costs[node] = 1_000_000
      @discovered[node] = nil
      @solved[node] = nil
    end
    @costs[start_node] = 0

    while !discovered.empty?
      current_node = @discovered.min_by{|node, value| @costs[node]}.first
      @discovered.delete(current_node)
      @nodes[current_node].edges.each do |node2, cost|
        path = @costs[current_node] + cost
        if path < @costs[node2.value]
          @costs[node2.value] = path
          @solved[node2.value] = current_node
        end
      end
    end
    {costs: @costs, path: @solved}
 end

 def shortest_distance(start_node, finish_node)
    djikstra_algorithm(start_node, finish_node)[:costs][finish_node]
 end


 

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
  if @edges[node].nil? || cost < @edges[node]
   @edges[node] = cost
  end
 end

 def removeEdge(node)
   @edges.delete(node)
 end

end
