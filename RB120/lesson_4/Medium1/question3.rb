# In the last question Alan showed Alyssa this code which keeps track of items for a shopping cart application:
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Alyssa noticed that this will fail when update_quantity is called.
Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it.
One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?
=end

#####
# If fixed that way `quantity` can be altered directly without going through `update_quantity`, 
# this can circumvent the `if updated_count >= 0` condition.