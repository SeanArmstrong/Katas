require "score_states"

module GameState
  
  POINTS = "POINTS"
  PLAYER_1_WINS = "PLAYER_1_WINS"
  PLAYER_2_WINS = "PLAYER_2_WINS"
  PLAYER_1_ADVANTAGE = "PLAYER_1_ADVANTAGE"
  PLAYER_2_ADVANTAGE = "PLAYER_2_ADVANTAGE"
  DEUCE = "DEUCE"

  class Calculator
    def calculate(player1_score, player2_score)
      return DEUCE if deuce?(player1_score, player2_score)
      return advantage_player(player1_score, player2_score) if advantage?(player1_score, player2_score)
      return winning_player(player1_score, player2_score) if player_has_won?(player1_score, player2_score)
      return POINTS
    end

    private

    def deuce?(player1_score, player2_score)
      player1_score >= ScoreStates::FORTY &&
        player2_score >= ScoreStates::FORTY &&
          player1_score == player2_score
    end

    def advantage?(player1_score, player2_score)
      advantage_player?(player1_score, player2_score) ||
        advantage_player?(player2_score, player1_score)
    end

    def advantage_player(player1_score, player2_score)
      return PLAYER_1_ADVANTAGE if advantage_player?(player1_score, player2_score)
      PLAYER_2_ADVANTAGE
    end

    def advantage_player?(score1, score2)
      score2 >= ScoreStates::FORTY && score1 == score2 + 1
    end

    def player_has_won?(player1_score, player2_score)
      winning_player?(player1_score, player2_score) ||
        winning_player?(player2_score, player1_score)
    end

    def winning_player(player1_score, player2_score)
      return PLAYER_1_WINS if winning_player?(player1_score, player2_score)
      PLAYER_2_WINS
    end

    def winning_player?(score1, score2)
      score1 > ScoreStates::FORTY && score2 < ScoreStates::FORTY ||
        score1 > ScoreStates::FORTY && score1 > (score2 + 1)
    end
  end
end
