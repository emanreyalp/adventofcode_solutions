def get_checksum_for(input)
  elements = input.split("")
  last_char = elements[elements.length-1]
  check_summ = 0
  occur = 0
  
  elements.each do |current_char|
    if(last_char == current_char)
      occur = occur + 1
    else
      check_summ = check_summ + last_char.to_i * occur
      last_char = current_char
      occur = 0
    end
  end
  check_summ = check_summ + last_char.to_i * occur
end
