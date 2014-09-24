class Opener

  def start
    running = true
    puts "Welcome to Mastermind!"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = ''
    while running
      input = gets.chomp
      case input
      when "p", "play"
        game = Game.new
        game.start_game
      when "i", "instructions"
        Instructions.instructions
      when "q", 'quit'
        running = false
        puts "You have quit the game, you panzy ass bitch, quitting is for suckers!"
      end
    end
  end


end
