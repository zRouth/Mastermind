require_relative 'sequence_generator'
require_relative 'display'
require_relative 'guess_checker'
require 'time'

class GameLoop

  attr_reader :input, :display, :round_counter, :final_code, :display, :guess, :timer

  def initialize(input)
    @input = input
    @round_counter = 0
    @final_code = SequenceGenerator.new.generate_sequence
    @display = DisplayPrinter.new
    @guess = GuessChecker.new
    @timer = Time.now
  end

  def play_game
    until win? || quit? || lose
      player_guess
    end
  end

  def player_guess
    @round_counter += 1
    puts display.keep_guessing
    input.get
    if quit?
      then puts @display.quitting
    else
      puts @display.error_message if @guess.invalid_guess(input.input)
      @final_code
      position = @guess.positions(@final_code, input.input)
      color = @guess.find_colors(@final_code, input.input)
      puts @display.color_position(color, position)
    end
  end

  def win?
    if input.input == @final_code
      time_in_seconds = (Time.now - @timer).to_i
      puts @display.you_win(@final_code, @round_counter, time_in_seconds)
      true
    end
  end

  def quit?
    input.input == "q" || input.input == "quit"
  end

  def lose
    puts display.you_lose if round_counter == 10
  end

end
