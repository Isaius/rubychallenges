class JokenpoObject
  def defeat
    :defeat
  end

  def win
    :win
  end

  def draw
    :draw
  end
end

class Rock < JokenpoObject
  def vs(opponent)
    return defeat if opponent.is_a?(Paper)

    return win if opponent.is_a?(Scissor)

    return draw if opponent.is_a?(Rock)
  end
end

class Paper < JokenpoObject
  def vs(opponent)
    return draw if opponent.is_a?(Paper)

    return defeat if opponent.is_a?(Scissor)

    return win if opponent.is_a?(Rock)
  end
end

class Scissor < JokenpoObject
  def vs(opponent)
    return win if opponent.is_a?(Paper)

    return draw if opponent.is_a?(Scissor)

    return defeat if opponent.is_a?(Rock)
  end
end

class Game
  attr_reader :winner

  def initialize(opponent_a, opponent_b)
    @winner = case opponent_a.vs(opponent_b)
              when :win
                opponent_a
              when :defeat
                opponent_b
              else
                :nil
              end
  end
end

puts Game.new(Rock.new, Paper.new).winner
