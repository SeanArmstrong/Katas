require "score_calculator"
require "player"

RSpec.describe ScoreCalculator do

  let(:player1) { Player.new("Tim") }
  let(:player2) { Player.new("Nadal") }
  let(:calculator) { ScoreCalculator.new }

  describe "calculate" do
    context "when both players have not scored" do
      it "returns the correct score" do
        allow(player1).to receive(:score).and_return(0)
        allow(player2).to receive(:score).and_return(0)
        expect(calculator.calculate(player1, player2)).to eq("Love : Love")
      end
    end

    context "when one player has scored" do
      it "returns the correct score" do
        allow(player1).to receive(:score).and_return(1)
        allow(player2).to receive(:score).and_return(0)
        expect(calculator.calculate(player1, player2)).to eq("Fifteen : Love")
      end
    end

    context "when both players have scored" do
      it "returns the correct score" do
        allow(player1).to receive(:score).and_return(1)
        allow(player2).to receive(:score).and_return(1)
        expect(calculator.calculate(player1, player2)).to eq("Fifteen : Fifteen")
      end
    end

    context "when one player has thirty" do
      it "returns the correct score" do
        allow(player1).to receive(:score).and_return(2)
        allow(player2).to receive(:score).and_return(1)
        expect(calculator.calculate(player1, player2)).to eq("Thirty : Fifteen")
      end
    end

    context "when one player has forty" do
      it "returns the correct score" do
        allow(player1).to receive(:score).and_return(1)
        allow(player2).to receive(:score).and_return(3)
        expect(calculator.calculate(player1, player2)).to eq("Fifteen : Forty")
      end
    end

    context "when both players have 'Forty'" do
      it "returns the deuce game score" do
        allow(player1).to receive(:score).and_return(3)
        allow(player2).to receive(:score).and_return(3)
        expect(calculator.calculate(player1, player2)).to eq("Deuce")
      end
    end

    context "when player 1 has advantage" do
      it "returns the player with the advantage" do
        allow(player1).to receive(:score).and_return(4)
        allow(player2).to receive(:score).and_return(3)
        expect(calculator.calculate(player1, player2)).to eq("Advantage Tim")
      end
    end

    context "when player 2 has advantage" do
      it "returns the player with the advantage" do
        allow(player1).to receive(:score).and_return(3)
        allow(player2).to receive(:score).and_return(4)
        expect(calculator.calculate(player1, player2)).to eq("Advantage Nadal")
      end
    end

    context "when player 1 has won" do
      it "returns the player has won" do
        allow(player1).to receive(:score).and_return(4)
        allow(player2).to receive(:score).and_return(2)
        expect(calculator.calculate(player1, player2)).to eq("Tim Wins")
      end
    end

    context "when player 2 has won" do
      it "returns the player has won" do
        allow(player1).to receive(:score).and_return(1)
        allow(player2).to receive(:score).and_return(4)
        expect(calculator.calculate(player1, player2)).to eq("Nadal Wins")
      end
    end

    context "when player has won from advantage" do
      it "returns the player has won" do
        allow(player1).to receive(:score).and_return(4)
        allow(player2).to receive(:score).and_return(6)
        expect(calculator.calculate(player1, player2)).to eq("Nadal Wins")
      end
    end

    context "when both players are on advantage" do
      it "returns the deuce game score" do
        allow(player1).to receive(:score).and_return(5)
        allow(player2).to receive(:score).and_return(5)
        expect(calculator.calculate(player1, player2)).to eq("Deuce")
      end
    end
  end
end
