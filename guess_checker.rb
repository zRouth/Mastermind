require_relative 'sequence_generator'
require_relative 'display'
require_relative 'game_loop'

class GuessChecker

  def initialize
    @display = DisplayPrinter.new
  end


  def positions(code, guess)
    positions = code.chars.zip(guess.chars)
    positions = positions.select {|x, y| x == y}
    positions.length
  end

  def find_colors(code, guess)
    code.chars.uniq.count do |char|
      guess.include?(char)
    end
  end

  def invalid_guess(guess)
    guess.length != 4
  end

end
