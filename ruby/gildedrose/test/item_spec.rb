require 'item'

RSpec.describe Item, "#initialize" do
  it "sets quality to 50 if quality > 50" do
    item = Item.new("Foo", 10, 100, BasicItemType.new)
    expect(item.quality).to eq(50)
  end
end

RSpec.describe Item, "#update_quality" do
  describe "item with positive quality and sell_in" do
    it "reduces the count of sell_in by 1" do
      item = Item.new("Foo", 10, 10, BasicItemType.new)
      item.update_quality
      expect(item.quality).to eq(9)
    end

    it "reduces the count of quality by 1" do
      item = Item.new("Foo", 10, 10, BasicItemType.new)
      item.update_quality
      expect(item.sell_in).to eq(9)
    end
  end

  context "quality of item is zero" do
    it "maintain a 0 quality" do
      item = Item.new("Foo", 10, 0, BasicItemType.new)
      item.update_quality
      expect(item.quality).to eq(0)
    end
  end

  context "when the sell in date has passed" do
    it "reduces the quality by half" do
      item = Item.new("Foo", 0, 10, BasicItemType.new)
      item.update_quality
      expect(item.quality).to eq(5)
    end

    it "does not reduce the sell_in date" do
      item = Item.new("Foo", 0, 10, BasicItemType.new)
      item.update_quality
      expect(item.sell_in).to eq(0)
    end
  end
end
