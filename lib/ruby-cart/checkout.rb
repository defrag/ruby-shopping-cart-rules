class Checkout
  attr_reader :items, :rules
  
  def initialize(promotional_rules = [])
    @items = [] 
    @rules = promotional_rules
  end
  
  def scan(item)
    self.items << item    
  end
    
  def total
    total = 0
    discount = 0
    rules = self.rules.sort_by{ |rule| -rule.priority} 
    rules.map{ |rule| discount += rule.discount_for(self.items) }
    self.items.map{ |item| total += item.price}
    (total - discount).round(2)
  end  
            
end