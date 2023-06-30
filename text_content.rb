# frozen_string_literal: true

require "./display"

module TextContent
  include Display
  def turn_message(message, number = nil)
    {
      "breaker_init" => "The computer has created master code and now it's time for you to break it!",
      "turn_number" => "Turn ##{number}, enter 4 digit code ranging from 1 to 6.",
      "incorrect_code" => red("Incorrect input, the code must be 4 digits betweet 1 to 6.")
    }[message]
  end
end
