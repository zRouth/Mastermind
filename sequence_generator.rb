class SequenceGenerator

  def initialize
    @colors = ['r','g','b','y']
    @sequence = ''
  end

  def generate_sequence
    4.times.map { @colors.sample }.join
  end
end










#
# def make_sequence
#   @colors.each do |color|
#     @colors.shuffle!
#     @sequence += @colors[0]
#   end
# end
