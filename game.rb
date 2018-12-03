require './player'
require './question'
require './turn_manager'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @turn_manager = TurnManager.new(@players)
  end

  def play
    while game_over?
      turn = @turn_manager.next_turn
      current_player = turn.current
      question = Question.new
      print "#{current_player.name}: "
      print "#{question.ask_question}"
      answer = gets.chomp.to_i
      question.check_answer?(answer) ? nil : current_player.lose_life
      game_over?
      score
    end
    end_game
  end

  def score
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    puts "----- NEW TURN -----"
  end

  def game_over?
    return @player1.lives > 0 && @player2.lives > 0
  end

  def next_turn
    @current_player = get_current_player
    @other_player = get_other_player(@current_player)
    @players.rotate!
  end 

  def end_game
    winner = @players.select{|player| not player.has_life?}.first
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Goodbye."
  end
end