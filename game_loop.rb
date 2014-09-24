require_relative 'sequence_generator'
require_relative 'display'
require_relative 'guess_checker'
require 'time'

class GameLoop

  attr_reader :command, :display

  def initialize(opener)
    @opener = opener
    @command = ''
    @round_counter = 0
    @final_code = SequenceGenerator.new.generate_sequence
    @display = DisplayPrinter.new
    @guess = GuessChecker.new
    @timer = Time.now
  end

  def play_game
    until @opener.command == "q" || @opener.command == "quit"
    player_guess
    end
  end

  def player_guess
    win
    @round_counter += 1
    puts display.keep_guessing
    @opener.command = gets.strip
    puts @display.error_message if @guess.invalid_guess(@opener.command)
    @final_code
    position = @guess.positions(@final_code, @opener.command)
    color = @guess.find_colors(@final_code, @opener.command)
    puts @display.color_position(color, position)
  end

  def win
    if @opener.command == @final_code
      time_in_seconds = (Time.now - @timer).to_i
      puts @display.you_win(@final_code, @round_counter, time_in_seconds)
      exit
    end
  end


end














  # def color_generator
  #   generate = (0..3).map {['r','g','b','y'].sample}
  # end
  #
  #
  # def game_loop?
  #   while @round_counter <= 9
  #     start_player_guess
  #   end
  # end
  #
  # def win?
  #   guess == @color_sequence
  # end
  #
  # def exit?
  #   command == "q" || command == "quit"
  # end
