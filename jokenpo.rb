class JokenpoObject
  attr_accessor :wins_against, :loses_to

  def draw?(opponent)
    is_a?(opponent.class)
  end

  def win(opponent)
    opponent.is_a?(@wins_against)
  end

  def vs(opponent)
    return :nil if draw?(opponent)
    return self if win(opponent)

    opponent
  end
end

class Rock < JokenpoObject
  def initialize
    super()
    @wins_against = Scissor
    @loses_to = Paper
  end
end

class Paper < JokenpoObject
  def initialize
    super()
    @wins_against = Rock
    @loses_to = Scissor
  end
end

class Scissor < JokenpoObject
  def initialize
    super()
    @wins_against = Paper
    @loses_to = Rock
  end
end

class Game
  attr_reader :winner

  def initialize(opponent_a, opponent_b)
    @winner = opponent_a.vs(opponent_b)
  end
end

puts "Paper   Win: #{Game.new(Rock.new, Paper.new).winner}"
puts "Scissor Win: #{Game.new(Scissor.new, Paper.new).winner}"
puts "Rock    Win: #{Game.new(Scissor.new, Rock.new).winner}"
puts "Draw:   #{Game.new(Rock.new, Rock.new).winner}"
