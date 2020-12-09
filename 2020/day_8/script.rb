require 'pry'

module Script
  @@acc = 0

  def self.file_read(filename)
    File.readlines(filename).map{ |l| l.split() }
  end

  def self.run(filename = 'test_input')
    instructions = file_read(filename)
    int = 0
    check_arr = []
    loop do
      if int > (instructions.size - 1)
        puts @@acc
        return
      end

      break if check_arr[int] == 1

      check_arr[int] = 1
      int += self.do(instructions[int])
    end

    puts @@acc
  end

  def self.do(instruction)
    case instruction.first
    when 'nop'
      return 1
    when 'acc'
      @@acc += instruction.last.to_i
      return 1
    when 'jmp'
      return instruction.last.to_i
    else
      pust '###### unexpected instruction ######'
    end
  end

  def self.fixrun(filename = 'test_input')
    instructions_temp = file_read(filename)

    amount_of_instruction = (instructions_temp.size-1)
    for i in 0..amount_of_instruction do
      int = 0
      instructions = instructions_temp.dup
      check_arr = []

      instructions[i] = self.swap(instructions[i])

      loop do
        if int > amount_of_instruction
          puts @@acc
          return
        end

        if check_arr[int] == 1
          break
        end

        check_arr[int] = 1
        int += self.do(instructions[int])
      end

      @@acc = 0
    end

    puts @@acc
  end

  def self.swap(instruction)
    case instruction.first
    when 'nop'
      return ['jmp', instruction.last]
    when 'jmp'
      return ['nop', instruction.last]
    else
      return instruction
    end
  end
end

# Script.run
# Script.fixrun
# Script.run('input')
Script.fixrun('input')
