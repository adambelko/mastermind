# frozen_string_literal: true

require "./display"

module TextContent
  include Display
  def message(message, number = nil)
    {
      "breaker_init" => "The computer has created master code and now it's time for you to break it!",
      "maker_init" => "Enter 4-digit code between 1 and 6.",
      "master_code" => "You set master code to:",
      "turn_info" => "Turn ##{number}: Enter 4-digit code between 1 and 6.",
      "turn_info_computer" => "Turn ##{number}: Computer's guess is:",
      "cracked_code" => green("Well done! You cracked the code!"),
      "computer_lost" => green("Woohoo! Computer couldn't solve the master code in 12 turns!"),
      "invalid_input" => red("Invalid input, select option 1 or option 2"),
      "invalid_code" => red("Invalid code, the code must be 4-digits betweet 1 and 6."),
      "game_over" => red("Game over! You couldn't break the code in 12 turns.")
    }[message]
  end
end
