# Deprecated and split into two
class ScoreCalculator
  def calculate(player1, player2)
    return deuce_output if deuce?(player1.score, player2.score)
    return advantage_player(player1, player2) if advantage?(player1.score, player2.score)
    return winning_player(player1, player2) if player_has_won?(player1.score, player2.score)
    basic_score_output(player1.score, player2.score)
  end

  private 

  def advantage?(player1_score, player2_score)
    advantage_player?(player1_score, player2_score) ||
      advantage_player?(player2_score, player1_score)
  end

  def advantage_player(player1, player2)
    return advantage_output(player1.name) if advantage_player?(player1.score, player2.score)
    advantage_output(player2.name)
  end

  def advantage_player?(score1, score2)
    score2 >= ScoreStates::FORTY && score1 == score2 + 1
  end

  def player_has_won?(player1_score, player2_score)
    winning_player?(player1_score, player2_score) ||
      winning_player?(player2_score, player1_score)
  end

  def winning_player(player1, player2)
    return win_output(player1.name) if winning_player?(player1.score, player2.score)
    win_output(player2.name)
  end

  def winning_player?(score1, score2)
    score1 > ScoreStates::FORTY && score2 < ScoreStates::FORTY ||
      score1 > ScoreStates::FORTY && score1 > (score2 + 1)
  end

  def deuce?(player1_score, player2_score)
    player1_score >= ScoreStates::FORTY &&
      player2_score >= ScoreStates::FORTY &&
        player1_score == player2_score
  end

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
