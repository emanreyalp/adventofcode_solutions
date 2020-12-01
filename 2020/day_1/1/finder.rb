class Finder
  def self._2020
    nums = []
    nums_i = []
    File.open('input', 'r') do |f|
      f.each_with_index do |line, i|
        nums[line.to_i] = 1
        nums_i[i] = line.to_i
      end
    end

    nums_i.each do |year|
      other_year = 2020 - year

      puts other_year * year unless nums[other_year].nil?
    end

  end
end

Finder._2020
