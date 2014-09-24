gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'sequence_generator'
require_relative 'game_loop'
require_relative 'guess_checker'



class SequenceGeneratorTest < Minitest::Test

  # def test_make_sequence
  #   sequence = SequenceGenerator.new
  #   assert_equal ['r','g','b','y'], sequence.generate_sequence
  # end

  def test_color_position
    guess_check = GuessChecker.new
    assert_equal 2, guess_check.positions('rrgb', 'yryb')
    assert_equal 2, guess_check.find_colors('rryr', 'rygb')
  end

end













#   def test_check_if_guess
#     mastermind = Game.new
#     assert_equal 3, mastermind.checker('rrgb')
#   end
#
#   def test_check_weird_guesses
#     mastermind = Game.new
#     assert_equal 2, mastermind.guess_check("rrbb")
#     assert_equal 1, mastermind.guess_check("yyyy")
#     assert_equal 3, mastermind.guess_check("rrgy")
#     assert_equal 1, mastermind.guess_check("bbbb")
#     assert_equal 4, mastermind.guess_check("rygb")
#     assert_equal 2, mastermind.guess_check("rb")
#   end
#
# end
