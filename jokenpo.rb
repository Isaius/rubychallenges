class JokenpoObject
  def draw?(defensor, opponent)
    defensor.is_a?(opponent.class)
  end

  def win(opponent, wins_against)
    opponent.is_a?(wins_against)
  end

  def defeat(opponent, loses_to)
    opponent.is_a?(loses_to)
  end

  def game(defensor, opponent, wins_against, loses_to)
    return :nil if draw?(defensor, opponent)
    return self if win(opponent, wins_against)
    return opponent if defeat(opponent, loses_to)
  end
end

class Rock < JokenpoObject
  def initialize
    super()
    @wins_against = Scissor
    @loses_to = Paper
  end

  def vs(opponent)
    game(self, opponent, @wins_against, @loses_to)
  end
end

class Paper < JokenpoObject
  def initialize
    super()
    @wins_against = Rock
    @loses_to = Scissor
  end

  def vs(opponent)
    game(self, opponent, @wins_against, @loses_to)
  end
end

class Scissor < JokenpoObject
  def initialize
    super()
    @wins_against = Paper
    @loses_to = Rock
  end

  def vs(opponent)
    game(self, opponent, @wins_against, @loses_to)
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
