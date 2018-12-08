require 'game_state_calculator'
require 'score_outputter'

class TennisGame
  
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1 
    @player2 = player2
  end

  def get_score
    # Old way
    # ScoreCalculator.new.calculate(player1, player2)

    # New way
    state = GameState::Calculator.new.calculate(player1.score, player2.score)
    ScoreOutputter.new.resolve(state, player1, player2)
  end

  def player1_scores_point
    player1.increase_score
  end

  def player2_scores_point
    player2.increase_score
  end
end
