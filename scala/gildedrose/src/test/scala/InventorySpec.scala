import org.scalatest._

class InventorySpec extends FunSpec with Matchers {

  describe("updateQuality") {
    describe("basic item") {
      describe("when quality and sell_in is positive") {
        it("reduces sell_in and quality by 1") {
          val item = Item("Foo", sell_in = 10, quality = 10)

          var inventory = Inventory(Seq(item))
          inventory = inventory.update_quality

          assert(inventory.items.head.sell_in == 9)
          assert(inventory.items.head.quality == 9)
        }
      }

      describe("when sell by date has passed") {
        it("reduces quality by half") {
          val item = Item("Foo", sell_in = 0, quality = 10)

          var inventory = Inventory(Seq(item))
          inventory = inventory.update_quality

          assert(inventory.items.head.sell_in == 0)
          assert(inventory.items.head.quality == 5)
        }
      }

      describe("when a quality is already 0") {
        it("maintains the quality as 0") {
          val item = Item("Foo", sell_in = 10, quality = 0)

          var inventory = Inventory(Seq(item))
          inventory = inventory.update_quality

          assert(inventory.items.head.sell_in == 9)
          assert(inventory.items.head.quality == 0)
        }
      }
    }

    describe("Increase by age item") {

    }
  }
}