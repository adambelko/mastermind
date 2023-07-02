# Shared methods for CodeMaker and CodeBraker

module GameMethods
  private

  def create_master_code
    Array.new(4).map { rand(1..6).to_s }
  end

  def take_input
    code = gets.chomp
    return convert_to_array(code) if valid_code?(code)

    puts message("invalid_code")
    take_input
  end

  def convert_to_array(code)
    code.split("")
  end

  def valid_code?(code)
    code.match?(/\A[1-6]{4}\z/)
  end

  def game_over?
    counter > 12
  end

  def display_code(code)
    output = ""
    code.map do |element|
      output << code_colors[element]
    end

    output
  end
end
