import quality.BasicItemQualityCalculator

case class Inventory(items: Seq[Item]) {

  def update_quality: Inventory = {
    Inventory(items.map(item => {
      Item(
        item.name,
        calculate_sell_in(item),
        calculate_quality(item)
      )
    }))
  }

  private def calculate_quality(item: Item): Int = {
    if (item.name == "Aged Brie") {
      item.quality + 1
    } else {
      val calculator = new BasicItemQualityCalculator
      calculator.calculate(item)
    }
  }

  private def calculate_sell_in(item: Item): Int = {
    if (item.sell_in == 0) {
      item.sell_in
    } else {
      item.sell_in - 1
    }
  }
}
