require 'game_state_calculator'

RSpec.describe GameState::Calculator do
  let(:calculator) { GameState::Calculator.new }

  describe "calculate" do
    context "when both players have not scored" do
      it "returns POINTS" do
        expect(calculator.calculate(0, 0)).to eq(GameState::POINTS)
      end
    end

    context "when one player has scored" do
      it "returns POINTS" do
        expect(calculator.calculate(1, 0)).to eq(GameState::POINTS)
        expect(calculator.calculate(0, 1)).to eq(GameState::POINTS)
      end
    end

    context "when both players have scored" do
      it "returns POINTS" do
        expect(calculator.calculate(1, 1)).to eq(GameState::POINTS)
      end
    end

    context "when one player has thirty" do
      it "returns POINTS" do
        expect(calculator.calculate(2, 1)).to eq(GameState::POINTS)
        expect(calculator.calculate(1, 2)).to eq(GameState::POINTS)
      end
    end

    context "when one player has forty" do
      it "returns POINTS" do
        expect(calculator.calculate(2, 3)).to eq(GameState::POINTS)
        expect(calculator.calculate(3, 2)).to eq(GameState::POINTS)
      end
    end

    context "when both players have 'Forty'" do
      it "returns the deuce game score" do
        expect(calculator.calculate(3, 3)).to eq(GameState::DEUCE)
      end
    end

    context "when player 1 has advantage" do
      it "returns the player with the advantage" do
        expect(calculator.calculate(4, 3)).to eq(GameState::PLAYER_1_ADVANTAGE)
      end
    end

    context "when player 2 has advantage" do
      it "returns the player with the advantage" do
        expect(calculator.calculate(3, 4)).to eq(GameState::PLAYER_2_ADVANTAGE)
      end
    end

    context "when player 1 has won" do
      it "returns the player has won" do
        expect(calculator.calculate(4, 0)).to eq(GameState::PLAYER_1_WINS)
        expect(calculator.calculate(4, 1)).to eq(GameState::PLAYER_1_WINS)
        expect(calculator.calculate(4, 2)).to eq(GameState::PLAYER_1_WINS)
      end
    end

    context "when player 2 has won" do
      it "returns the player has won" do
        expect(calculator.calculate(0, 4)).to eq(GameState::PLAYER_2_WINS)
        expect(calculator.calculate(1, 4)).to eq(GameState::PLAYER_2_WINS)
        expect(calculator.calculate(2, 4)).to eq(GameState::PLAYER_2_WINS)
      end
    end

    context "when player has won from advantage" do
      it "returns the player has won" do
        expect(calculator.calculate(3, 5)).to eq(GameState::PLAYER_2_WINS)
        expect(calculator.calculate(4, 6)).to eq(GameState::PLAYER_2_WINS)
        expect(calculator.calculate(5, 7)).to eq(GameState::PLAYER_2_WINS)
      end
    end

    context "when both players are on advantage" do
      it "returns the deuce game score" do
        expect(calculator.calculate(4, 4)).to eq(GameState::DEUCE)
      end
    end

    context "when both players are continuing passed advantage" do
      it "returns the deuce game score" do
        expect(calculator.calculate(5, 5)).to eq(GameState::DEUCE)
        expect(calculator.calculate(6, 6)).to eq(GameState::DEUCE)
      end
    end
  end
end
