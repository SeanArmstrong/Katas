require 'item_types/legendary'

RSpec.describe LegendaryItemType, "#update_quality" do
  it "maintains its quality and sell_in" do
    item_type = LegendaryItemType.new
    result = item_type.update_quality(10, 10)

    expect(result).to eq({
      sell_in: 10,
      quality: 10
    })
  end
end
