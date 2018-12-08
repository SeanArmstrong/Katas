require 'item_types/conjured'

RSpec.describe ConjuredItemType, "#update_quality" do

  item_type = ConjuredItemType.new

  context "when sell_in > 0" do
    it "reduces sell_in and quality by 2" do
      result = item_type.update_quality(10, 10)

      expect(result).to eq({
        sell_in: 9,
        quality: 8
      })
    end
  end

  context "when sell_in == 0" do
    it "reduces sell_in and quality by 4" do
      result = item_type.update_quality(0, 10)

      expect(result).to eq({
        sell_in: 0,
        quality: 2
      })
    end
  end

  context "when quality == 0" do
    it "maintains the quality of 0 and reduces sell in" do
      result = item_type.update_quality(10, 0)

      expect(result).to eq({
        sell_in: 9,
        quality: 0
      })
    end
  end
end
