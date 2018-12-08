class Item
  
  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality, item_type)
    @name = name
    @sell_in = sell_in
    @quality = quality > 50 ? 50 : quality
    @item_type = item_type
  end

  def update_quality
    return if quality == 0

    updated_quality = @item_type.update_quality(sell_in, quality)

    @sell_in = updated_quality[:sell_in]
    @quality = updated_quality[:quality]
  end
end
