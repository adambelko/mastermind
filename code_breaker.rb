require "./game_methods"
require "./text_content"
require "./display"

class CodeBreaker
  attr_accessor :master_code, :player_guess, :counter

  include GameMethods
  include TextContent
  include Display

  def initialize
    @master_code = create_master_code
    @counter = 1
  end

  def start_game
    puts
    puts message("breaker_init")
    puts message("turn_info", counter)

    @player_guess = take_input
    game_loop(master_code, player_guess)
  end

  private

  def game_loop(master_code, player_guess)
    display_guess(master_code, player_guess)

    return puts message("cracked_code") if matched?

    self.counter += 1
    return puts message("game_over") if game_over?

    puts
    puts message("turn_info", counter)

    player_guess = take_input
    game_loop(master_code, player_guess)
  end

  def display_guess(master_code, player_guess)
    puts
    puts "Your guess is:"
    puts "#{display_code(player_guess)}  Clues: #{display_clues(master_code, player_guess)}"
    puts
  end

  def display_clues(master_code, player_guess)
    clues_arr = []
    matched_indexes = []

    player_guess.each_with_index do |player_value, index|
      master_value = master_code[index]

      if master_value == player_value
        clues_arr << clues["full_match"]
        matched_indexes << index

      elsif master_code.include?(player_value) && !matched_indexes.include?(master_code.index(player_value))
        clues_arr << clues["partial_match"]
        matched_indexes << master_code.index(player_value)
      end
    end

    sorted_clues = clues_arr.sort_by { |clue| [clue == clues["full_match"] ? 0 : 1, clue.length] }
    sorted_clues.join(" ")
  end

  def matched?
    master_code == player_guess
  end
end
