gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'sequence_generator'
require_relative 'game_loop'
require_relative 'guess_checker'


class SequenceGeneratorTest < Minitest::Test

  def test_colors
    colors = SequenceGenerator.new
    assert_equal ['r','g','b','y'], colors.colors
  end

  def test_sequence
    colors = SequenceGenerator.new
    assert_equal '', colors.sequence
  end

  def test_generate_sequence
    colors = SequenceGenerator.new
    assert_equal 4, colors.generate_sequence.length
  end


end
