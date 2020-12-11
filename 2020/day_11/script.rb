require 'pry'

module Script
  def self.run(filename = 'test_input')
    seats = read_from_file(filename)
    changed = true

    max_iteration = 100
    updated_seats = seats

    loop do
      updated_seats, changed = update(updated_seats)
      # binding.pry
      max_iteration -= 1
      break if !changed || max_iteration < 0
    end
    # binding.pry
    puts updated_seats.inject(0){|s,l| s+= l.count('#')}
  end

  def self.read_from_file(filename)
    @@seats ||= File.readlines(filename, chomp: true).map{|line| line.chars}
  end

  def self.update(seats)
    new_seats = []
    changed = false

    seats.each_with_index do |value, line|
      new_seats[line] = []
      last_line = seats.count - 1

      value.each_with_index do |seat, column|
        last_column = value.count - 1

        if seat == '.'
          new_seats[line][column] = seat

          next
        end

        nw = seats[line-1][column-1] if line > 0 && column > 0
        n = seats[line-1][column] if line > 0
        ne = seats[line-1][column+1] if line > 0 && column < last_column
        w = seats[line][column-1] if column > 0
        e = seats[line][column+1] if column < last_column
        sw = seats[line+1][column-1] if line < last_line && column > 0
        s = seats[line+1][column] if line < last_line
        se = seats[line+1][column+1] if line < last_line && column < last_column

        neigbors = [nw, n, ne, w, e, sw, s, se]

        if neigbors.count('#') == 0
          new_seats[line][column] = '#'

          changed = true if seats[line][column] != '#'
        elsif neigbors.count('#') >= 4
          new_seats[line][column] = 'L'

          changed = true if seats[line][column] != 'L'
        else
          new_seats[line][column] = seat
        end
      end
    end

    [new_seats, changed]
  end
end

Script.run('input')
# Script.run
