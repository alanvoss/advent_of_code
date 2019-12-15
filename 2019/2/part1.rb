#!/usr/bin/env ruby

inputs = File.open('inputs.txt').first.split(',').map(&:to_i)

# restore the gravity assist program
inputs[1] = 12
inputs[2] = 2

(0..(inputs.length / 4)).each do |n|
    opcode, operand1, operand2, position = inputs[n * 4, 4]

    if opcode == 1
        inputs[position] = inputs[operand1] + inputs[operand2]
        puts "new #{position} is #{inputs[position]}"
    elsif opcode == 2
        inputs[position] = inputs[operand1] * inputs[operand2]
        puts "new #{position} is #{inputs[position]}"
    elsif opcode == 99
        puts "all done"
        break
    else
        raise "We shouldn't have an opcode of #{opcode}"
    end
end

puts inputs[0]
