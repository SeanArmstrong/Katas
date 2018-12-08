package quality
import gildedrose.Item

class BasicItemQualityCalculator {
  def calculate(item: Item): Int = {
    if (item.quality == 0) {
      item.quality
    } else if (item.sell_in == 0) {
      item.quality / 2
    } else {
      item.quality - 1
    }
  }
}
