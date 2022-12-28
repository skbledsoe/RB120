
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


#solving the error by changing reader to accessor and preceding quantity
#with self in the update method could be problematic in that we may not
#want product_name to have a setter method
#it also allows quantity to be changed by accessing it directly, 
#such as invoice.quantity = 5, rather than needing to go through
#the update_quantity method.