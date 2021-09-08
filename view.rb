class View
  def display(records)
    records.each_with_index do |record, index|
      puts "#{index + 1}. File name: #{record.name}, File content: #{record.content}"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
