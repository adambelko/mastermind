# frozen_string_literal: true

module GameLogic
  def create_master_code
    Array.new(4).map { rand(1..6) }
  end
end
