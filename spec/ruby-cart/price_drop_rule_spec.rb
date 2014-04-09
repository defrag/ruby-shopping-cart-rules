#encoding: utf-8
require_relative '../spec_helper'
describe PriceDropRule do
  
  before do
    @product = Product.new('001', 9.25)
    @rule = PriceDropRule.new('001')
  end
  
  it "should drop prices to 8.50 gbp for two products matching default rules" do
    p1 = @product
    p2 = @product.clone
    @rule.discount_for([p1, p2]).must_equal(0)
    p1.price.must_equal(8.50)
    p2.price.must_equal(8.50)
  end
  
  it "should not include other products while counting matches" do
    p1 = @product
    p2 = @product.clone
    @rule.discount_for([p1, p2, Product.new('007', 1.25), Product.new('007', 1.25)]).must_equal(0)
    p1.price.must_equal(8.50)
    p2.price.must_equal(8.50)
  end
  
  it "should not return any discount on default one sale" do
    @rule.discount_for([@product]).must_equal(0.00)
  end  
       
end
