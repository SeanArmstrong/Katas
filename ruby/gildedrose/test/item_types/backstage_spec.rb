require 'item_types/backstage'

RSpec.describe BackstageItemType, "#update_quality" do

  item_type = BackstageItemType.new

  context "when sell_in > 10" do
    it "reduces sell_in and increases quality by 1" do
      result = item_type.update_quality(11, 10)

      expect(result).to eq({
        sell_in: 10,
        quality: 11
      })
    end
  end

  context "when sell_in <= 10" do
    it "reduces sell_in and doubles the quality" do
      result = item_type.update_quality(10, 10)

      expect(result).to eq({
        sell_in: 9,
        quality: 20
      })
    end
  end

  context "when sell_in <= 5" do
    it "reduces sell_in and triples the quality" do
      result = item_type.update_quality(5, 10)

      expect(result).to eq({
        sell_in: 4,
        quality: 30
      })
    end
  end
end
