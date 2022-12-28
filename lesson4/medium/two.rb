class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0 #could also use
                                  #self.quantity if there was a setter
                                  #method for quantity variable
  end
end

invoice = InvoiceEntry.new('paper', 10)
puts invoice.quantity
invoice.update_quantity(15)
puts invoice.quantity