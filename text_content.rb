# frozen_string_literal: true

require "./display"

module TextContent
  include Display
  def message(message, number = nil)
    {
      "breaker_init" => "The computer has created master code and now it's time for you to break it!",
      "turn_info" => "Turn ##{number}: Enter 4 digit code ranging from 1 to 6.",
      "cracked_code" => green("Well done! You cracked the code!"),
      "invalid_code" => red("Invalid code, the code must be 4 digits betweet 1 to 6."),
      "game_over" => red("Game over! You couldn't break the code in 12 turns.")
    }[message]
  end
end
