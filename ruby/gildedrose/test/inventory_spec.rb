require 'inventory'

RSpec.describe Inventory do
  describe "add_item" do
    it "adds a item to the list" do
      inventory = Inventory.new
      new_item = Item.new("Foo", 1, 50, BasicItemType.new)
      inventory.add_item(new_item)
      expect(inventory.items.size).to eq(1)
    end
  end

  describe "update_quality" do
    it "updates the quality of all items" do
      inventory = Inventory.new

      item1 = Item.new("Foo", 1, 50, BasicItemType.new)
      item2 = Item.new("Foo", 10, 10, BasicItemType.new)

      inventory.add_item(item1)
      inventory.add_item(item2)

      expect(item1).to receive(:update_quality)
      expect(item2).to receive(:update_quality)

      inventory.update_quality
    end
  end
end
