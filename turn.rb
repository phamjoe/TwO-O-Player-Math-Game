class Turn 
  attr_reader :current, :other
  def initialize current, other
    @current = current
    @other = other
  end
end