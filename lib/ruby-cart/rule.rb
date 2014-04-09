class Rule
  attr_reader :product_code, :priority
  
  def initialize(product_code, priority = 10)
    @product_code = product_code
    @priority = priority
  end
  
  def discount_for(items) raise 'discount_for not implemented'; end
  
end