class Game

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @players = [@player1, @player2]
  end

  def correct_sum(n1, n2)
    n1 + n2
  end

  def correct_answer?(answer1, answer2)
    if answer1 == answer2
      return true
    else
      return false
    end
  end

  def display_status
    puts "----------------------------------"
    puts "\t end-of-turn STATUS"
    puts "----------------------------------"
    puts "#{@player1.name} has #{@player1.lives}/3 lives left"
    puts "#{@player2.name} has #{@player2.lives}/3 lives left"
    
  end

  def next_round
    puts "----------------------------------"
    puts "\t New Round"
    puts "----------------------------------"
    @players.rotate!
    puts @players.inspect
  end

  def winner
    winner = @players.find{|player| !player.lost?}
    puts "The winner is ~~~ *drum rolls* ~~~~"
    sleep(2)
    puts winner.name
  end

  def game_over?
    @players.select{|player| player.lost?}.count > 0
  end

  def play
    until game_over? do
      num1 = rand(1..20)
      num2 = rand(1..20)
      current_player = @players.first
      questioner = @players.last
      sleep(1)
      next_round
     
      questioner.asks_question(num1, num2)

      player_answer = current_player.answers_question #get user input
      correct_answer = correct_sum(num1, num2) #the answer to the question
      
      sleep(1)

      if correct_answer?(player_answer, correct_answer)
        questioner.approves
      else
        questioner.disapproves
        current_player.lose_life
        puts "#{current_player.name} lost 1 life :(("
      end

      sleep(1)
      display_status
    end
    
    winner # declare the winner

  end
end