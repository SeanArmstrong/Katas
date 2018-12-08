require 'tennis_game'
require 'player'

RSpec.describe TennisGame do

  let(:player1) { Player.new("Tim") }
  let(:player2) { Player.new("Nadal") }
  let(:game) { TennisGame.new(player1, player2) }

  describe "#initialize" do
    it "sets up our tennis game with 2 players" do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end
  end

  describe "#player1_scores_point" do
    it "calls incease score on player1" do
      expect(player1).to receive(:increase_score)
      game.player1_scores_point
    end
  end

  describe "#player2_scores_point" do
    it "calls incease score on player2" do
      expect(player2).to receive(:increase_score)
      game.player2_scores_point
    end
  end

  describe "#get_score" do
    # it "returns the current score from the score calculator" do
    #   expect_any_instance_of(ScoreCalculator).to receive(:calculate)
    #   game.get_score
    # end

    it "gets the game state from the GameState::Calculator" do
      allow(player1).to receive(:score).and_return(1)
      allow(player2).to receive(:score).and_return(2)

      expect_any_instance_of(GameState::Calculator).to receive(:calculate).with(player1.score, player2.score)
      game.get_score
    end

    it "passes the game state to the score outputter" do
      allow_any_instance_of(GameState::Calculator).to receive(:calculate).and_return(GameState::POINTS)
      expect_any_instance_of(ScoreOutputter).to receive(:resolve).with(GameState::POINTS, player1, player2)
      game.get_score
    end
  end

  describe "Implementation Test" do
    it "Plays out as expected" do
      expect(game.get_score).to eq("Love : Love")
      
      game.player1_scores_point

      expect(game.get_score).to eq("Fifteen : Love")

      game.player1_scores_point

      expect(game.get_score).to eq("Thirty : Love")

      game.player2_scores_point

      expect(game.get_score).to eq("Thirty : Fifteen")

      game.player2_scores_point

      expect(game.get_score).to eq("Thirty : Thirty")

      game.player1_scores_point

      expect(game.get_score).to eq("Forty : Thirty")

      game.player2_scores_point

      expect(game.get_score).to eq("Deuce")

      game.player1_scores_point

      expect(game.get_score).to eq("Advantage Tim")

      game.player2_scores_point

      expect(game.get_score).to eq("Deuce")

      game.player2_scores_point

      expect(game.get_score).to eq("Advantage Nadal")

      game.player2_scores_point

      expect(game.get_score).to eq("Nadal Wins")
    end
  end
end
