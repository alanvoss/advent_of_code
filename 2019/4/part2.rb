#!/usr/bin/env ruby

# It is a six-digit number.
# The value is within the range given in your puzzle input.
# Two adjacent digits are the same (like 22 in 122345).
# Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
# the two adjacent matching digits are not part of a larger group of matching digits

puts ((145852..616942).map(&:to_s).select do |n|
  n_chars = n.split('')
  n_chars.chunk_while { |x, y| x == y }.find { |z| z.length == 2 } && n == n_chars.sort.join('')
end).length
