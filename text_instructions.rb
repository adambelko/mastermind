# frozen_string_literal: true

require "./display"

module TextInstructions
  include Display

  def display_instructions
    puts
    puts "This is a 1 player game against the computer."
    puts "You can choose to be the code #{underline("maker")} or the code #{underline("braker")}."
    puts
    puts "There are six different number/color combinations:"
    puts
    puts code_colors.values.join("")
    puts
    puts
    puts "The code maker will choose four to create a 'master code'. For example,"
    puts
    puts "#{code_colors["2"]}#{code_colors["2"]}#{code_colors["5"]}#{code_colors["1"]}"
    puts
    puts "As you can see, there can be #{red("more then one")} of the same number/color."
    puts "In order to win, the code breaker needs to guess the 'master code' in 12 or less turns."
    puts
    puts
    puts underline("Clues:")
    puts "After each guess, there will be up to four clues to help crack the code."
    puts
    puts "#{clues["full_match"]} This clue means you have 1 correct number in the correct location."
    puts "#{clues["partial_match"]} This clue means you have 1 correct number, but in the wrong location."
    puts
    puts underline("Clues Example:")
    puts 'To continue with the example, using the above "master code" a guess of "2541" would produce 3 clues:'
    puts
    print "#{code_colors["2"]}#{code_colors["5"]}#{code_colors["4"]}#{code_colors["1"]} "
    print "Clues: #{clues["full_match"]} #{clues["full_match"]} #{clues["partial_match"]}\n"
    puts
    puts
    puts "There is 2 correct numbers in the correct location and 1 correct number in a wrong location."
    puts
    puts underline("Now it's time to play!")
    puts "Would you like to be a code MAKER or code BRAKER?"
    puts
    puts 'Press "1" to be the code MAKER'
    puts 'Press "2" to be the code BRAKER'
  end
end
