require './turn'

class TurnManager

  def initialize players
    @players = players
    @index = 0
  end

  def next_turn
    current = @players[@index]
    other = get_other current

    switch_turn
    Turn.new(current,other)
  end
  def switch_turn
    @index = (@index + 1) % @players.count
  end

  def get_other current
    @players.select {|p| p != current && !p.has_life?}.sample
  end
end