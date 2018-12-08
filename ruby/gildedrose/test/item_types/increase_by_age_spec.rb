require 'item_types/increase_by_age'

RSpec.describe IncreaseByAgeItemType, "#update_quality" do

  item_type = IncreaseByAgeItemType.new

  context "when sell_in > 0" do
    it "reduces sell_in and increases quality by 1" do
      result = item_type.update_quality(10, 10)

      expect(result).to eq({
        sell_in: 9,
        quality: 11
      })
    end
  end

  context "when sell_in == 0" do
    it "reduces sell_in and quality by half" do
      result = item_type.update_quality(0, 10)

      expect(result).to eq({
        sell_in: 0,
        quality: 5
      })
    end
  end

  context "when quality if >= 50" do
    it "sets the quality to 50" do
      result = item_type.update_quality(10, 50)

      expect(result).to eq({
        sell_in: 9,
        quality: 50
      })
    end
  end
end
