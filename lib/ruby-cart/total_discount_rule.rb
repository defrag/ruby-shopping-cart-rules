class TotalDiscountRule < Rule
  attr_reader :threshold, :discount_percentage
  
  def initialize(threshold = 60.00, discount_percentage = 10)
    @threshold = threshold
    @discount_percentage = discount_percentage
    @priority = -1 #make sure this has the least execution priority
  end
  
  def discount_for(products = [])
    total = 0
    products.map{ |item| total += item.price }
    total > self.threshold ? total / self.discount_percentage : 0.00
  end
  
end
  