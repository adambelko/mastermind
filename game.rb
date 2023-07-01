# frozen_string_literal: true

require "./text_instructions"
require "./code_breaker"

class Game
  include TextInstructions

  def play
    display_instructions
    game_mode = take_input

    code_maker if game_mode == "1"
    code_breaker if game_mode == "2"
  end

  def take_input
    input = gets.chomp
    return input if %w[1 2].include?(input)

    puts "Incorrect input, try again"
    take_input
  end

  def code_maker
    puts "Code maker coming soon :)"
  end

  def code_breaker
    breaker = CodeBreaker.new
    breaker.start_game
  end
end

Game.new.play
