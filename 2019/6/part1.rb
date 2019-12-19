#!/usr/bin/env ruby

inputs = File.open('inputs.txt').map(&:chomp)
orbitors = Hash[inputs.map { |input| input.split(")").reverse }]
count = 0

orbitors.keys.each do |orbitor|
  pointer = orbitor
  while true
    pointer = orbitors[pointer]
    break unless pointer
    count += 1
  end
end

puts "total direct and indirect orbit count: #{count}"
