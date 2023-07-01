require "./game_logic"
require "./text_content"
require "./display"

class CodeBreaker
  attr_accessor :master_code, :user_guess, :counter

  include GameLogic
  include TextContent
  include Display

  def initialize
    @master_code = create_master_code
    @counter = 1
    puts "Master code is #{master_code}"
  end

  def start
    puts
    puts turn_message("breaker_init")
    puts turn_message("turn_number", counter)

    @user_guess = take_input
    compare(master_code, user_guess)
  end

  private

  def compare(master_code, user_guess)
    puts
    puts "Your guess is now:"
    puts "#{display_code(user_guess)}  Clues: #{display_clues(master_code, user_guess)}"
    puts
    return puts "And you cracked the code!" if matched?(master_code, user_guess)

    self.counter += 1
    puts
    puts "Keep trying!"
    puts turn_message("turn_number", counter)
    user_guess = take_input
    compare(master_code, user_guess)
  end

  def matched?(master_code, user_guess)
    master_code == user_guess
  end

  def take_input
    code = gets.chomp
    return convert_to_array(code) if valid_code?(code)

    puts turn_message("incorrect_code")
    take_input
  end

  def display_code(code)
    output = ""
    code.map do |element|
      output << code_colors[element]
    end

    output
  end

  def display_clues(master_code, user_guess)
    clues_arr = []
    matched_indexes = []

    user_guess.each_with_index do |user_value, index|
      master_value = master_code[index]

      if master_value == user_value
        clues_arr << clues["full_match"]
        matched_indexes << index

      elsif master_code.include?(user_value) && !matched_indexes.include?(master_code.index(user_value))
        clues_arr << clues["partial_match"]
        matched_indexes << master_code.index(user_value)
      end
    end

    clues_arr.join(" ")
  end

  def convert_to_array(code)
    code.split("")
  end

  def valid_code?(code)
    code.match?(/\A[1-6]{4}\z/)
  end
end
