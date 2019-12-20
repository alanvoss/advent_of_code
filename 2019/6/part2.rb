#!/usr/bin/env ruby

def make_graph(inputs)
  nodes = {}
  inputs.each do |input|
    orbitee, orbitor = input.split(")")

    nodes[orbitee] ||= []
    nodes[orbitee].push(orbitor)
    nodes[orbitor] ||= []
    nodes[orbitor].push(orbitee)
  end

  nodes 
end

def find_path(nodes, origin, destination)
  queue = nodes[origin].map { |node| [node, []] }
  visited = {}
  
  while !queue.empty?
    next_node, path = queue.shift

    nodes[next_node].reject { |node| visited[node] }.each do |node|
      visited[node] = 1
      return path if node == destination
      queue.push([node, path + [node]])
    end
  end
end

inputs = File.open('inputs.txt').map(&:chomp)
nodes = make_graph(inputs)
first = "YOU"
last = "SAN"
path = find_path(nodes, first, last)
puts "From #{first} to #{last} is #{path.inspect} and is #{path.count} hops."
