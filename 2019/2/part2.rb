#!/usr/bin/env ruby

def run_instructions(inputs)
  (0..(inputs.length / 4)).each do |n|
    opcode, operand1, operand2, position = inputs[n * 4, 4]
  
    if opcode == 1
      inputs[position] = inputs[operand1] + inputs[operand2]
    elsif opcode == 2
      inputs[position] = inputs[operand1] * inputs[operand2]
    elsif opcode == 99
      break
    else
      raise "We shouldn't have an opcode of #{opcode}"
    end
  end

  inputs[0]
end

inputs = File.open('inputs.txt').first.split(',').map(&:to_i)

(0..99).each do |noun|
  (0..99).each do |verb|
    new_inputs = inputs.clone
    new_inputs[1] = noun
    new_inputs[2] = verb
    if run_instructions(new_inputs) == 19690720
      puts "The pair that produces 19690720 is noun: #{noun}, verb: #{verb}"
      puts 100 * noun + verb
      break
    end
  end
end
