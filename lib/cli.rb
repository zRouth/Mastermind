require_relative 'game_loop'
require_relative 'display'
require_relative 'user_input'

class CLI

  attr_reader :display, :input

  def initialize
    @input = UserInput.new
    @display = DisplayPrinter.new
  end

  def start
    puts display.welcome
    until exit?
      input.get
      options
    end
  end

  def options
    case
    when play?
      puts display.first_guess
      game = GameLoop.new(input)
      game.play_game
    when instructions?
      puts display.instructions
    when exit?
      puts display.quitting
    end
  end




  def instructions?
    input.input == "i" || input.input == "instructions"
  end

  def exit?
    input.input == "q" || input.input== "quit"
  end

  def play?
    input.input == "p" || input.input == "play"
  end

end
