require "./display"

class Game
  include Display

  def play
    display_instructions
  end
end

Game.new.play
