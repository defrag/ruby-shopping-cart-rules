#encoding: utf-8
require_relative '../spec_helper'
describe TotalDiscountRule do
  
  before do
    @rule = TotalDiscountRule.new
  end
  
  it "should return original price if total items sum is less or equal default of sixty gbp" do
    @rule.discount_for([Product.new('007', 60.00)]).must_equal(0.0)    
    @rule.discount_for([Product.new('007', 10.00), Product.new('007', 10.00)]).must_equal(0.0)
  end
  
  it "should return defatult ten percentage discount on over sixty gbp sales" do
    @rule.discount_for([Product.new('007', 80.00)]).must_equal(8.0)    
    @rule.discount_for([Product.new('007', 80.00), Product.new('007', 30.00)]).must_equal(11.0)
    @rule.discount_for([Product.new('007', 80.00), Product.new('007', 30.00), Product.new('001', 30.00)]).must_equal(14.0)
  end  
       
end
