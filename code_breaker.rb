# frozen_string_literal: true

require "./game_logic"
require "./text_content"

class CodeBreaker
  attr_accessor :master_code, :guess, :correct_num_and_pos, :correct_num

  include GameLogic
  include TextContent

  def initialize
    @master_code = create_master_code
  end

  def start
    puts turn_message("breaker_init")
    take_input
  end

  def take_input
    code = gets.chomp
    return puts "Valid code" if valid_code?(code)

    puts turn_message("incorrect_code")
    take_input
  end

  private

  def valid_code?(code)
    code.match?(/\A[1-6]{4}\z/)
  end
end
