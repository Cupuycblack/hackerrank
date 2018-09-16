#!/bin/ruby

require 'json'
require 'stringio'

# Complete the maximizingXor function below.
def maximizingXor(l, r)
    range = (l..r).to_a
    range.product(range).map{ |a, b| a ^ b }.max 
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

l = gets.to_i

r = gets.to_i

result = maximizingXor l, r

fptr.write result
fptr.write "\n"

fptr.close()
