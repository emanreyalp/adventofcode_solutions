require 'benchmark'

class QuestionCounter
  def initialize(file_name = 'test_input')
    @answers = read_answers(file_name)
  end

  def read_answers(file_name)
    f = File.open(file_name).read
    f.split("\n\n").map{ |l| l.split }
  end

  def sum
    # require 'pry'; binding.pry
    @answers.inject(0){ |sum,x| sum + x.inject([]){|s,a| s + a.chars}.uniq.count }
  end

  def other_sum
    @answers.inject(0){ |sum,x| sum + x.inject(x.first.chars){|s,a| s = s & a.chars}.uniq.count }
  end
end

bm = Benchmark.measure {
  # puts QuestionCounter.new.sum
  puts QuestionCounter.new('input').sum
}

puts bm
