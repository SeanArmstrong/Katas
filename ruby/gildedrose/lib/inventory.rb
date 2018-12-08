class Inventory

  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end

  def update_quality
    # If we are not allowed to store the item type in the item.
    # Then we probably have to get the type from the name here
    # This may be true as items may not be required to know about their selling rule
    items.each(&:update_quality)
  end

  def add_item(item)
    @items << item
  end
end
