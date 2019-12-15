#!/usr/bin/env ruby

def place_inputs(sparse, instruction_set, id)
  distance = nil
  coordinate = [0, 0]
  displacement = { "U" => [0, 1], "D" => [0, -1], "L" => [-1, 0], "R" => [1, 0] }

  instruction_set.each do |instruction|
    direction, number = instruction.split(%r{(?<=[UDLR])})
    number = number.to_i
    this_displacement = displacement[direction]

    if number > 0
      (1..number).each do |n|
        coordinate = [coordinate[0] + this_displacement[0], coordinate[1] + this_displacement[1]]
        new_x, new_y = coordinate
        sparse[new_x] ||= {}

        this_distance = new_x.abs + new_y.abs
        if sparse[new_x][new_y] and (sparse[new_x][new_y] - [id]).length > 0
          if (!distance or this_distance < distance)
            distance = this_distance
          end
        end

        sparse[new_x][new_y] ||= []
        sparse[new_x][new_y].push(id)
      end
    end
  end

  return [sparse, distance]
end

inputs = File.open('inputs.txt').to_a

instruction_sets = inputs.map { |input| input.split(",") }
sparse = {}

new_sparse, _ = place_inputs(sparse, instruction_sets[0], "A")
_, distance = place_inputs(new_sparse, instruction_sets[1], "B")

puts "least manhattan distance is #{distance}"
