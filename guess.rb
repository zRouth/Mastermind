class Guess

  def initialize(guess)
    @guess = guess.chars.map(&:upcase)
  end

  def to_s
    @guess.join('')
  end

  def self.valid?(guess)
    guess.to_s.upcase =~ /^[RGBY]{4}$/
  end
