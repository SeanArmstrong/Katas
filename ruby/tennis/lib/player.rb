require 'score_states'
class Player

  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = ScoreStates::LOVE
  end

  def increase_score
    @score = @score + 1
  end
end
