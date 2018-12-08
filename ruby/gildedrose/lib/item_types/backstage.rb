class BackstageItemType
  def update_quality(sell_in, quality)
    if sell_in > 10
      new_sell_in = sell_in - 1
      new_quality = quality + 1
    elsif sell_in > 5
      new_sell_in = sell_in - 1
      new_quality = quality * 2
    elsif sell_in > 0
      new_sell_in = sell_in - 1
      new_quality = quality * 3
    else
      new_sell_in = 0
      new_quality = quality / 2
    end
    
    {
      sell_in: new_sell_in,
      quality: [0, new_quality].max
    }
  end
end
