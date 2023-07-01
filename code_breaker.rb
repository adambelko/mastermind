require "./game_logic"
require "./text_content"
require "./display"

class CodeBreaker
  attr_accessor :master_code, :user_guess, :correct_num_and_pos, :correct_num, :counter

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
    puts "Your guess is now"
    puts display_code(user_guess)
    return puts "You cracked the code!" if master_code == user_guess

    self.counter += 1
    puts "Keep trying"
    puts turn_message("turn_number", counter)
    user_guess = take_input
    compare(master_code, user_guess)
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

    puts output
  end

  def convert_to_array(code)
    code.split("")
  end

  def valid_code?(code)
    code.match?(/\A[1-6]{4}\z/)
  end
end
