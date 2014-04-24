require 'rspec'
require 'pry-debugger'
require_relative '../map.rb'

describe 'node' do 

  let(:node){Node.new("Austin")}
  it "initializes with a name and edges hash" do 
    expect(node.value).to eq("Austin")
    expect(node.edges).to eq({})
  end
  it "can add an edge" do 
    node2 = Node.new("SF")
    node.addEdge(node2, 100)
    expect(node.edges).to eq({node2 => 100 })
  end

  it "can remove an edge" do
    node2 = Node.new("SF")
    node.addEdge(node2, 100)
    node.removeEdge(node2)
    expect(node.edges).to eq({})
  end
end

describe 'graph' do 
  let(:graph){Graph.new}
# let(:node){Node.new("SF")}
  it "initializes with 3 empty hashes" do 
  expect(graph.nodes).to eq({})
  expect(graph.discovered).to eq({})
  expect(graph.solved).to eq({})
  end

  it "can add a node" do 
    node = graph.addNode("Austin")
    expect(graph.nodes).to eq({"Austin" => node})
  end

  it "can remove a node" do 
    node = graph.addNode("Austin")
    graph.removeNode("Austin")
    expect(graph.nodes).to eq({})
  end

  it "can add an edge" do 
    node = graph.addNode("Austin")
    node2 = graph.addNode("Seattle")
    graph.addEdge("Austin","Seattle",400)
    expect(node.edges).to eq({node2 => 400})
  end

  it "can remove an edge" do
    node = graph.addNode("Austin")
    node2 = graph.addNode("Seattle")
    graph.addEdge("Austin","Seattle",400)
    graph.removeEdge("Austin","Seattle")
    expect(node.edges).to eq({})
    expect(node2.edges).to eq({})
 end

  describe "djikstra_algorithim" do 
    let(:graph){Graph.new}
    before do 
    graph.addNode("Austin")
    graph.addNode("Seattle")
    graph.addNode("London")
    graph.addNode("Tokyo")
    graph.addNode("Helsinki")
    graph.addNode("Taipei")
    graph.addNode("Seoul")
    graph.addNode("Bangkok")

    graph.addEdge("Austin", "Seattle", 100)
    graph.addEdge("Austin", "London", 400)
    graph.addEdge("Seattle", "Tokyo", 300)
    graph.addEdge("Seattle", "Taipei", 200)
    graph.addEdge("London", "Helsinki", 500)
    graph.addEdge("Tokyo", "Helsinki", 200)
    graph.addEdge("Tokyo", "Seoul", 300)
    graph.addEdge("Taipei","Seoul", 100 )
    graph.addEdge("Tokyo", "Austin", 50)


  end

  it "returns shortest distance between 2 nodes" do 
    expect(graph.shortest_distance("Austin", "Helsinki")).to eq(600)

  end

end 
end