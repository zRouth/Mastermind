require_relative 'sequence_generator'
require_relative 'display'
require_relative 'game_loop'

class GuessChecker

  def positions(code, guess)
    code.chars.zip(guess.chars).select {|x, y| x == y}.length
  end

  def find_colors(code, guess)
    code.chars.uniq.count do |char|
      guess.include?(char)
    end
  end

  def invalid_guess(guess)
    guess.length != sequence_length
  end

  def sequence_length
    4
  end

end









  # def initialize
  #   @display = DisplayPrinter.new
  # end
