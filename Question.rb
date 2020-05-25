class Question
  attr_reader :num1, :num2, :actual_answer

  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
    @actual_answer = num1 + num2
  end

  def ask_question(player)
    print "#{player.name}: What does #{num1} + #{num2} equal? "
  end
end
