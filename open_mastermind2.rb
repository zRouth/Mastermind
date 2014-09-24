require_relative 'game_loop'
require_relative 'display'

class Opener

  attr_reader :display
  attr_accessor :command

  def initialize
    @command = ""
    @display = DisplayPrinter.new
  end

  def start
    puts display.welcome
    until exit?
      @command = gets.strip
      options
    end
  end

  def options
    case
    when play?
      puts display.first_guess
      game = GameLoop.new(self)
      game.play_game
    when instructions?
      puts display.instructions
    when exit?
      puts display.quitting
    end
  end




  def instructions?
    command == "i" || command == "instructions"
  end

  def exit?
    command == "q" || command == "quit"
  end

  def play?
    command == "p" || command == "play"
  end

end
