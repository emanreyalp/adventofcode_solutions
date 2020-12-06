require 'pry'

class BoardingPasses
  attr_accessor :passes

  def initialize
    @passes = read_from_file

      # require 'pry'; binding.pry

  end

  def read_from_file
    File.readlines('input')
    # File.readlines('test_input')
  end

  def get_highest_number
    # highest = 0
    # @passes.each do |pass|
    #   id = calculate_id_for(pass)

    #   highest = id if id > highest
    # end

    #

    seat_ids.max
  end

  def seat_ids
    @passes.map {|pass| calculate_id_for(pass)}
  end

  def get_my_seat_id
    # binding.pry

    prev = seat_ids[0]
    seat_ids.sort.each_with_index do |id, i|
      next if i == 0

      if (id - prev) == 2
        # binding.pry
        return id - 1
      end

      prev = id
    end

    # prev + 1
  end

  def calculate_id_for(pass)
    row = get_row(pass[0..6])
    column = get_column(pass[7..9])

    row * 8 + column
  end

  def get_row(string)
    string.tr('B', '1').tr('F', '0').to_i(2)
  end

  def get_column(string)
    string.tr('R', '1').tr('L', '0').to_i(2)
  end
end

puts BoardingPasses.new.get_my_seat_id
