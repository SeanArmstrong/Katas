require 'score_states'
require 'player'

RSpec.describe Player do
  describe "initialize" do
    it "sets the player name" do
      expect(Player.new("Tim").name).to eq("Tim")
    end

    it "defaults the score" do
      expect(Player.new("Tim").score).to eq(ScoreStates::LOVE)
    end
  end

  describe "#increase_score" do
    it "increases the players score" do
      player = Player.new("Tim")
      player.increase_score

      expect(player.score).to eq(ScoreStates::FIFTEEN)
    end
  end
end
