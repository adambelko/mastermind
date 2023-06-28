module Display
  def self.red(string)
    "\e[31m#{string}\e[0m"
  end

  def self.underline(string)
    "\e[4;1m#{string}\e[0m"
  end

  def self.code_colors
    {
      "1" => "\e[101m  1  \e[0m",
      "2" => "\e[43m  2  \e[0m",
      "3" => "\e[44m  3  \e[0m",
      "4" => "\e[45m  4  \e[0m",
      "5" => "\e[46m  5  \e[0m",
      "6" => "\e[41m  6  \e[0m"
    }
  end

  def self.clues
    {
      "full_match" => "\e[91m\u25CF\e[0m",
      "partial_match" => "\e[37m\u25CB\e[0m"
    }
  end

  def display_instructions
    puts "This is a 1 player game against the computer."
    puts "You can choose to be the code #{Display.underline("maker")} or the code #{Display.underline("braker")}."
    puts
    puts "There are six different number/color combinations:"
    puts
    puts Display.code_colors.values.join(" ")
    puts
    puts
    puts "The code maker will choose four to create a 'master code'. For example,"
    puts
    puts "#{Display.code_colors["2"]} #{Display.code_colors["2"]} #{Display.code_colors["5"]} #{Display.code_colors["1"]}"
    puts
    puts "As you can see, there can be #{Display.red("more then one")} of the same number/color."
    puts "In order to win, the code breaker needs to guess the 'master code' in 12 or less turns."
    puts
    puts
    puts Display.underline("Clues:")
    puts "After each guess, there will be up to four clues to help crack the code."
    puts
    puts "#{Display.clues["full_match"]} This clue means you have 1 correct number in the correct location"
    puts "#{Display.clues["partial_match"]} This clue means you have 1 correct number, but in the wrong location."
    puts
    puts Display.underline("Clues Example:")
    puts 'To continue with the example, using the above "master code" a guess of "2541" would produce 3 clues:'
    puts
    print "#{Display.code_colors["2"]} #{Display.code_colors["5"]} #{Display.code_colors["4"]} #{Display.code_colors["1"]} "
    print "#{Display.clues["full_match"]} #{Display.clues["full_match"]} #{Display.clues["partial_match"]}\n"
    puts
    puts
    puts "There is 2 correct numbers in the correct location and 1 correct numbers in a wrong location."
    puts
    puts Display.underline("Now it's time to play!")
    puts "Would you like to be a code MAKER or code BRAKER?"
    puts
    puts 'Press "1" to be the code MAKER'
    puts 'Press "2" to be the code BRAKER'
  end
end
