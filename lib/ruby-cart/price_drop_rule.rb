class PriceDropRule < Rule
  attr_reader :quantity_needed, :discounted_price
  
  def initialize(product_code, discounted_price = 8.50, quantity_needed = 2)
    super(product_code)
    @discounted_price = discounted_price
    @quantity_needed = quantity_needed
  end
  
  def discount_for(products = [])
    discount = 0
    matches = products.select{ |product| product.code == self.product_code }     
    matches.each{ |product|  product.price = self.discounted_price } if matches.size >= self.quantity_needed
    discount
  end
  
end
