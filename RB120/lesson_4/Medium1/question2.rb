# Alan created the following code to keep track of items for a shopping cart application he's writing:
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

#######################################################

# There is no setter method for quantity so we can't alter the value of `quantity` inside `update_quantity`

# a = InvoiceEntry.new("thing", 7)
# a.update_quantity(8)
# a.quantity  # Still 7

class InvoiceEntry
  attr_accessor :quantity
  attr_reader :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

a = InvoiceEntry.new("thing", 7)
a.update_quantity(8)
p a.quantity  # now 8