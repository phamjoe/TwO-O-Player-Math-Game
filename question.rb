require './game'

class Question
  attr_reader :operand1, :operand2
  def initialize
    @operand1 = rand(20)
    @operand2 = rand(20)
  end
  def check_answer?(answer)
    if @operand1 + @operand2 == answer
      puts "YES! You are correct."
      return true
    else
      puts "Seriously? No."
      return false
    end
    
  end

  def ask_question
    puts "What does #{@operand1} plus #{@operand2} equal?"
  end
end