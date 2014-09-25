class DisplayPrinter

  def welcome
    "Welcome to Mastermind!\n" +
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def first_guess
    "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def keep_guessing
    "What's your guess?"
  end

  def instructions
    "Mastermind is a guessing game that involves logic and a bit of luck to win.\n" +
    "To start, the computer generates a sequence of random colors in selected positions unbeknownst to you.\n" +
    "On your first turn you will select 4 colors in the order you think the computer has generated.\n" +
    "The computer will then tell you which colors were correct and which positions (if any) were correct.\n" +
    "You will continue this guessing process until you have either guessed the color and positions correct or you quit the game.\n" +
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def quitting
    "You have quit the game, quitting is for suckers!"
  end

  def you_win(sequence, round_counter, timer)
    minutes, seconds = timer.divmod(60)
    "Congratulations! You guessed the sequence #{sequence} in #{round_counter} guesses over #{minutes} minutes #{seconds} seconds."
  end

  def you_lose
    "You lose!"
  end

  def error_message
    "You must guess a combination of 4 colors (colors can repeat)."
  end

  def color_position(letter_count, positions)
    "You have guessed #{letter_count} of the correct colors with #{positions} of the correct positions."
  end

end
