# frozen_string_literal: true

input_string = nil
File.open 'input/day01.txt' do |puzzle_in|
  input_string = puzzle_in.read
end

# input_string = "199
# 200
# 208
# 210
# 200
# 207
# 240
# 269
# 260
# 263"

increasing_count = 0
nums = input_string.split("\n").collect(&:to_i)
last_num = nums.max
nums.each do |num|
  increasing_count += 1 if num > last_num
  last_num = num
end

puts increasing_count

increasing_count_sw = 0
last_sum = nums.collect(&:abs).sum
nums[2..].reduce(nums[..2]) do |agg, num|
  increasing_count_sw += 1 if agg.sum > last_sum
  last_sum = agg.sum
  agg[1..] + [num]
end

puts increasing_count_sw
