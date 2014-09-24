require_relative 'open_mastermind2'

class Game
  attr_reader :sequence

  def initialize
    @sequence = ['r', 'g', 'b', 'y']
    @round_counter = 0
  end

  def start_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    game_loop
  end

  def player_guess
    running = true
    guess = gets.chomp
    if guess.length == 4
      if guess == sequence
        then puts "Congratulations, you have won!"
      else checker(guess)
        round_counter
      end
    else
      puts "You must guess at least 4 colors."
      player_guess
    end
    if @round_counter == 10
      then puts "You have failed."
    end
  end

  def checker(guess)
    letter_count = 0
    sequence_copy = sequence
    guess.split("").each do |letter|
      if sequence_copy.include?(letter)
        letter_count += 1
        sequence_copy.slice!(sequence_copy.index(letter))
      end
    end
    puts "You have guessed #{letter_count} of the correct colors."
  end

  def position_checker
    # sequence: "rgby"
    # => ["r", "g", "r", "r"]
    # guess: "rggg"
    # => ["r", "g", "g", "g"]
    # array.each_with_index do |letter, index|
    #   do stuff with each letter & index
    #   everytime each letter in the same index is the same,
    #   then increment a counter.
    #   position_counter should result in 2.
  end

  def sequence
    @sequence.sample(4)
  end

  def round_counter
    @round_counter += 1
  end

  def game_loop
    while @round_counter <= 9
      player_guess
    end
  end

end


#def random_array
    # (0..3).map do color_selection.sample
    # end.join






class Game2

  attr_reader :command, :turns, :round_counter, :guess

  def initialize
    @command = ""
    @color_sequence ||= color_generator
    @round_counter = 0
    @display = DisplayPrinter.new
  end

  def start_player_guess
    @command = gets.strip
    until win? || exit?
      if @command.length == 4
        if @command == @color_sequence
          then puts @display.you_win
        else guess_check(@command)
          round_counter
          start_player_guess
        end
      else puts @display.error_message
        start_player_guess
      end
      if round_counter == 10
        puts @display.you_lose
      end
    end
  end

  # def guess_check(guess)
  #   letter_count = 0
  #   @color_sequence_copy = @color_sequence
  #   guess.split("").each do |letter|
  #     if @color_sequence_copy.include?(letter)
  #       letter_count += 1
  #       @color_sequence_copy.slice!(@color_sequence_copy.index(letter))
  #     end
  #   end
  #   puts @display.number_of_colors_right(letter_count)
  # end

  def guess_check(guess)
    letter_count = 0
    @color_sequence_copy = @color_sequence
    guess.each do |letter|
      if color_sequence.include?(letter)
        letter_count += 1
        color_sequence.slice!(color_sequence.index(letter))
      end
    end
    puts @display.number_of_colors_right(letter_count)
  end


  def color_generator
    generate = (0..3).map {['r','g','b','y'].sample}
  end


  def game_loop?
    while @round_counter <= 9
      start_player_guess
    end
  end

  def win?
    guess == @color_sequence
  end

  def exit?
    command == "q" || command == "quit"
  end

end
