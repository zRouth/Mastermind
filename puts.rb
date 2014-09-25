class Puts

  attr_reader :puts

  def initialize(stdout = $stdout)
    puts = ''
    @stdout = stdout
  end

  def get
    @input = @stdin.gets.strip
  end

end
