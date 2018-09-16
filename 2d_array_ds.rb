#!/bin/ruby

require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
    i = 1
    sum_arr = []
    while i < 5
        y = 1
        while y < 5
            sum_arr << hourglassValue(arr, i, y)
            y += 1
        end
        i += 1
    end
    sum_arr.max
end
def hourglassValue(arr, i, y)
    arr[i-1][y-1] + arr[i-1][y] + arr[i-1][y+1] + arr[i][y] + arr[i+1][y-1] + arr[i+1][y] + arr[i+1][y+1]
end
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()
