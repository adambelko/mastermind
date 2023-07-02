require "./game_logic"
require "./text_content"
require "./display"

class CodeMaker
  attr_accessor :master_code, :computer_guess, :counter, :matched_indexes

  include GameLogic
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
    display_master_code(master_code)
    puts
    puts message("turn_info_computer", counter)
    game_loop
  end

  def game_loop
    @computer_guess = generate_guess
    display_guess(computer_guess)

    return puts "Computer cracked the code!" if matched?

    self.counter += 1
    return puts message("game_over") if game_over?

    puts
    puts message("turn_info_computer", counter)
    game_loop
  end

  def game_over?
    counter > 12
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
    return Array.new(4).map { rand(1..6).to_s } if counter == 1

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

  def display_master_code(master_code)
    puts display_code(master_code)
  end

  def display_guess(computer_guess)
    puts display_code(computer_guess)
  end

  def display_code(code)
    output = ""
    code.map do |element|
      output << code_colors[element]
    end

    output
  end

  def take_input
    code = gets.chomp
    return convert_to_array(code) if valid_code?(code)

    puts message("invalid_code")
    take_input
  end

  def convert_to_array(code)
    code.split("")
  end

  def valid_code?(code)
    code.match?(/\A[1-6]{4}\z/)
  end
end
