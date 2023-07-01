# frozen_string_literal: true

module Display
  def red(string)
    "\e[31m#{string}\e[0m"
  end

  def underline(string)
    "\e[4;1m#{string}\e[0m"
  end

  def code_colors
    {
      "1" => "\e[101m  1  \e[0m ",
      "2" => "\e[43m  2  \e[0m ",
      "3" => "\e[44m  3  \e[0m ",
      "4" => "\e[45m  4  \e[0m ",
      "5" => "\e[46m  5  \e[0m ",
      "6" => "\e[41m  6  \e[0m "
    }
  end

  def clues
    {
      "full_match" => "\e[91m\u25CF\e[0m",
      "partial_match" => "\e[37m\u25CB\e[0m"
    }
  end
end
