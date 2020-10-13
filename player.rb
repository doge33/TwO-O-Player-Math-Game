class Player

  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    self.lives -= 1
  end

  def asks_question(n1, n2)
    puts "#{@name}: what does #{n1} + #{n2} equal?"
  end

  def answers_question
    answer = gets.to_i
  end

  def approves
    puts "#{@name}: Right! That was brilliant!"
  end

  def disapproves
    puts "#{@name}: AWWW...you got it WRONG haha"
  end

  def lost?
    self.lives <= 0
  end 
end

