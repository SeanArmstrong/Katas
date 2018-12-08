require "score_outputter"
require "player"
require 'game_state_calculator'

RSpec.describe ScoreOutputter do
  let(:player1) { Player.new("Tim") }
  let(:player2) { Player.new("Nadal") }
  let(:score_outputter) { ScoreOutputter.new }

  context "when game is still in progress" do
    it "returns the current score for 0 : 0" do
      allow(player1).to receive(:score).and_return(0)
      allow(player2).to receive(:score).and_return(0)
      result = score_outputter.resolve(GameState::POINTS, player1, player2)
      expect(result).to eq("Love : Love")
    end

    it "returns the current score for 1 : 0" do
      allow(player1).to receive(:score).and_return(1)
      allow(player2).to receive(:score).and_return(0)
      result = score_outputter.resolve(GameState::POINTS, player1, player2)
      expect(result).to eq("Fifteen : Love")
    end

    it "returns the current score for 2 : 0" do
      allow(player1).to receive(:score).and_return(2)
      allow(player2).to receive(:score).and_return(0)
      result = score_outputter.resolve(GameState::POINTS, player1, player2)
      expect(result).to eq("Thirty : Love")
    end

    it "returns the current score for 2 : 3" do
      allow(player1).to receive(:score).and_return(2)
      allow(player2).to receive(:score).and_return(3)
      result = score_outputter.resolve(GameState::POINTS, player1, player2)
      expect(result).to eq("Thirty : Forty")
    end
  end

  context "when player1 has won" do
    it "returns the result" do
      result = score_outputter.resolve(GameState::PLAYER_1_WINS, player1, player2)
      expect(result).to eq("Tim Wins")
    end
  end

  context "when player2 has won" do
    it "returns the result" do
      result = score_outputter.resolve(GameState::PLAYER_2_WINS, player1, player2)
      expect(result).to eq("Nadal Wins")
    end
  end

  context "when player1 has advantage" do
    it "returns the result" do
      result = score_outputter.resolve(GameState::PLAYER_1_ADVANTAGE, player1, player2)
      expect(result).to eq("Advantage Tim")
    end
  end

  context "when player2 has advantage" do
    it "returns the result" do
      result = score_outputter.resolve(GameState::PLAYER_2_ADVANTAGE, player1, player2)
      expect(result).to eq("Advantage Nadal")
    end
  end

  context "deuce" do
    it "returns the result" do
      result = score_outputter.resolve(GameState::DEUCE, player1, player2)
      expect(result).to eq("Deuce")
    end
  end
end
