class Game
  attr_reader :difficulty
  attr_accessor :current_player, :turn

  def initialize(difficulty)
    @difficulty = difficulty
    @current_player = nil
    @turn = 1
  end

  def start_game
    print 'Player 1 name: '
    name = gets.chomp
    player1 = Player.new(name)

    print 'Player 2 name: '
    name = gets.chomp
    player2 = Player.new(name)

    while player1.lives > 0 && player2.lives > 0 do

      if @turn % 2 == 0
        current_player = player2
      else 
        current_player = player1
      end
      
      case difficulty
      when 'easy'
        question = Question.new(rand(1..20), rand(1..20))
      when 'medium'
        question = Question.new(rand(1..80), rand(1..80))
      when 'hard'
        question = Question.new(rand(1..200), rand(1..200))
      end

      puts "----- NEW TURN -----"
    
      question.ask_question(current_player)

      player_answer = gets.chomp

      if player_answer.to_i == question.actual_answer
        puts "YES! You are correct!"
      else 
        puts "That is unfortunately the wrong answer. - 1 life"
        current_player.lives -= 1
      end

      puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3\n\n"

      @turn += 1
    end

    if player1.lives > 0
      puts "#{player1.name} wins with #{player1.lives} #{player1.lives > 1 ? "lives" : "life"} left."
    end
    if player2.lives > 0
      puts "#{player1.name} wins with #{player1.lives} #{player2.lives > 1 ? "lives" : "life"} left."
    end
    puts "----- GAME OVER -----"
    puts "Thanks for playing. Good bye!"
    exit(0)
  end
end