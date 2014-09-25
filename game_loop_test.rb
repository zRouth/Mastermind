gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'sequence_generator'
require_relative 'game_loop'
require_relative 'guess_checker'

class GameLoopTest < Minitest::Test

  def test_player_command_is_stored
    command = GameLoop.new('')
    assert_equal '', command.input
  end

  def test_round_counter_starts_at_0
    round_counter = GameLoop.new('input')
    assert_equal 0, round_counter.round_counter
  end

  def test_if_game_makes_a_random_final_code
    code = GameLoop.new('')
    assert_equal 4, code.final_code.length
  end

  
end
