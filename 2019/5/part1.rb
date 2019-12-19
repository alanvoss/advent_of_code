#!/usr/bin/env ruby

def get_parameters(inputs, modes, instruction_pointer, count)
  (1..count).map do |n|
    mode = modes % 10
    modes /= 10

    if mode == 1
      inputs[instruction_pointer + n]
    else
      inputs[inputs[instruction_pointer + n]]
    end
  end
end

inputs = File.open('inputs.txt').first.split(',').map(&:to_i)
instruction_pointer = 0

while true
  instruction = inputs[instruction_pointer]
  opcode = instruction % 100
  modes = instruction / 100

  if opcode == 1
    inputs[inputs[instruction_pointer + 3]] = get_parameters(inputs, modes, instruction_pointer, 2).inject(:+)
    instruction_pointer += 4
  elsif opcode == 2
    inputs[inputs[instruction_pointer + 3]] = get_parameters(inputs, modes, instruction_pointer, 2).inject(:*)
    instruction_pointer += 4
  elsif opcode == 3
    puts "Input value> "
    inputs[inputs[instruction_pointer + 1]] = gets.chomp.to_i
    instruction_pointer += 2
  elsif opcode == 4
    puts "opcode 4 reached.  value: #{get_parameters(inputs, modes, instruction_pointer, 1).first}"
    instruction_pointer += 2
  elsif opcode == 99
    puts "all done"
    break
  else
    raise "We shouldn't have an opcode of #{opcode}"
  end
end
