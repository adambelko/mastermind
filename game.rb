# frozen_string_literal: true

require "./text_instructions"
require "./text_content"
require "./code_breaker"
require "./code_maker"

class Game
  include TextInstructions
  include TextContent

  def play
    display_instructions
    game_mode = take_input

    code_maker if game_mode == "1"
    code_breaker if game_mode == "2"
  end

  def take_input
    input = gets.chomp
    return input if %w[1 2].include?(input)

    puts message("invalid_input")
    take_input
  end

  def code_maker
    maker = CodeMaker.new
    maker.start_game
  end

  def code_breaker
    breaker = CodeBreaker.new
    breaker.start_game
  end
end

Game.new.play
