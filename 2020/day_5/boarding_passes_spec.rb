require_relative 'boarding_passes'

describe BoardingPasses do
  it 'test row numbers' do
    {
      'FBFBBFF' => 44,
      'BFFFBBF' => 70,
      'FFFBBBF' => 14,
      'BBFFBBF' => 102
    }.each do |row_text, row_number|
      # require 'pry'; binding.pry

      expect(described_class.new.get_row(row_text)).to eq row_number
    end
  end

  it 'test column numbers' do
    {
      'RLR' => 5,
      'RRR' => 7,
      'RLL' => 4
    }.each do |column_text, column_number|
      expect(described_class.new.get_column(column_text)).to eq column_number
    end
  end

  it 'test the generated id' do
    {
      'FBFBBFFRLR' => 357,
      'BFFFBBFRRR' => 567,
      'BFFFBBFRLR' => 565,
      'FFFBBBFRRR' => 119,
      'BBFFBBFRLL' => 820
    }.each do |pass_text, generated_id|
      expect(described_class.new.calculate_id_for(pass_text)).to eq generated_id
    end
  end

  it 'get the max id' do
    pass_texts = [
      'FBFBBFFRLR',
      'BBFFBBFRLL',
      'BFFFBBFRRR',
      'FFFBBBFRRR',
    ]

    object = described_class.new
    object.passes = pass_texts

    expect(object.get_highest_number).to eq 820
  end

  it 'get the my seat id' do
    pass_texts = [
      'FBFBBFFRLR',
      'BBFFBBFRLL',
      'BFFFBBFRLR', # 565
      'BFFFBBFRRR', # 567
      'FFFBBBFRRR',
    ]

    object = described_class.new
    object.passes = pass_texts

    expect(object.get_my_seat_id).to eq 566
  end
end
