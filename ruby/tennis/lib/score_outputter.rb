class ScoreOutputter
  def resolve(game_state, player1, player2)

    case game_state
      when GameState::POINTS
        basic_score_output(player1.score, player2.score)
      when GameState::PLAYER_1_WINS
        win_output(player1.name)
      when GameState::PLAYER_2_WINS
        win_output(player2.name)
      when GameState::PLAYER_1_ADVANTAGE
        advantage_output(player1.name)
      when GameState::PLAYER_2_ADVANTAGE
        advantage_output(player2.name)
      else
        deuce_output

    end
  end
  
  private

  def win_output(player_name)
    player_name + " Wins"
  end

  def deuce_output
    "Deuce"
  end

  def advantage_output(player_name)
    "Advantage " + player_name
  end

  def basic_score_output(score1, score2)
    score_map[score1] + " : " + score_map[score2]
  end

  def score_map
    {
      ScoreStates::LOVE => "Love",
      ScoreStates::FIFTEEN => "Fifteen",
      ScoreStates::THIRTY => "Thirty",
      ScoreStates::FORTY => "Forty",
    }
  end
end
