require "./game_methods"
require "./text_content"
require "./display"

class CodeMaker
  attr_accessor :master_code, :computer_guess, :counter, :matched_indexes

  include GameMethods
  include TextContent
  include Display

  def initialize
    @counter = 1
    @matched_indexes = Array.new(4)
  end

  def start_game
    puts
    puts message("maker_init")
    @master_code = take_input
    puts message("master_code")
    puts display_code(master_code)
    puts
    puts message("turn_info_computer", counter)
    game_loop
  end

  private

  def game_loop
    @computer_guess = generate_guess
    puts display_code(computer_guess)

    return puts "Computer cracked the code!" if matched?

    self.counter += 1
    return puts message("computer_lost") if game_over?

    puts
    puts message("turn_info_computer", counter)
    game_loop
  end

  def matched?
    master_code == computer_guess
  end

  def partial_match?
    master_code.each_with_index do |value, index|
      matched_indexes[index] = value if computer_guess[index] == master_code[index]
    end
  end

  def generate_guess
    return create_master_code if counter == 1

    partial_match?

    guess = Array.new(4)
    4.times do |index|
      guess[index] = if !matched_indexes[index].nil?
                       matched_indexes[index]
                     else
                       rand(1..6).to_s
                     end
    end

    guess
  end
end
