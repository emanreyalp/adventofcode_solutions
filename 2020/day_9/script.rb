require 'pry'

module Script
  def self.run(filename = 'test_input')
    numbers = read_from_file(filename)

    preamble = 25

    puts invalid_number = find_invalid(numbers, preamble)
  end

  def self.read_from_file(filename)
    @@numbers ||= File.readlines(filename).map(&:to_i)
  end

  def self.find_invalid(numbers, preamble)
    numbers[preamble..-1].each.with_index(preamble) do |value, index|
      return value unless self.validate(numbers[index-preamble..index-1].sort, value)
    end
  end

  def self.validate(nums, looking)
    left = 0
    right = nums.count-1

    while(left <= right)
      sum = nums[right] + nums[left]
      return true if sum == looking

      left += 1 if sum < looking
      right -= 1 if sum > looking

    false
  end
end

# Script.run
Script.run 'input'
