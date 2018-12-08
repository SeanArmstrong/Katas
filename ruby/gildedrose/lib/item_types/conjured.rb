class ConjuredItemType
  def update_quality(sell_in, quality)
    if sell_in > 0
      new_sell_in = sell_in - 1
      new_quality = quality - 2
    else
      new_sell_in = 0
      new_quality = quality / 4
    end

    {
      sell_in: new_sell_in,
      quality: [new_quality, 0].max
    }
  end
end
