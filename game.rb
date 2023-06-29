require "./display"

class Game
  include Display

  def play
    display_instructions
    game_mode = take_input

    code_maker if game_mode == "1"
    code_braker if game_mode == "2"
  end

  def take_input
    input = gets.chomp
    return input if %w[1 2].include?(input)

    puts "Incorrect input"
    take_input
  end

  def code_maker
    puts "Code maker"
  end

  def code_braker
    puts "Code braker"
  end
end

Game.new.play
