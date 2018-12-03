require './player'

player1 = Player.new()
player2 = Player.new()
player2.turn = false


while player1.lives > 0 && player2.lives > 0
  num1 = rand(1...20)
  num2 = rand(1...20)
  current_player = player1.turn ? player1 : player2
  player_turn = player1.turn ? "Player1: " : "Player2: "
  puts "#{player_turn}What does #{num1} plus #{num2} equal?"
  answer = gets.chomp.to_i
  if(answer == num1 + num2)
    puts "#{player_turn} YES! You are correct."
    if current_player == player1
      player2.turn = true
      player1.turn = false
    else current_player == player2
      player1.turn = true
      player2.turn = false
    end
  else
    "#{player_turn} Seriously? No."
    if current_player == player1
      player1.lives -= 1
      player2.turn = true
      player1.turn = false
    else current_player == player2
      player2.lives -= 1
      player1.turn = true
      player2.turn = false
    end

  end

  puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  puts "----- NEW TURN -----"

end
  winner = player1.turn ? "Player 1" : "Player 2"
  winner_lives = player1.lives != 0 ? player1.lives : player2.lives 
  puts "#{winner} wins with a score of #{winner_lives}/3"
  puts "----- GAME OVER -----"
  puts "Goodbye"
