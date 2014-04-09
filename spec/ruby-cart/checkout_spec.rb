#encoding: utf-8
require_relative '../spec_helper'
describe Checkout do
  
  before do
    promotional_rules = []
    @checkout = Checkout.new(promotional_rules)
  end
  
  it "should be empty at beginning" do
    @checkout.items.size.must_equal(0)
  end  
  
  it "should be able to add items" do
    item = Product.new('001', 9.25)
    @checkout.scan(item)
    @checkout.items.size.must_equal(1)
  end  
  
  it "should return correct price" do
    item = Product.new('001', 9.25)
    @checkout.scan(item)
    @checkout.total.must_equal(9.25)
  end
  
  describe "baskets" do
    before do
      promotional_rules = [TotalDiscountRule.new, PriceDropRule.new('001')]
      @co = Checkout.new(promotional_rules)
    end

    it "should return correct price for Basket: 001, 002, 003" do        
      item = Product.new('001', 9.25)
      item2 = Product.new('002', 45.00)
      item3 = Product.new('003', 19.95)
      @co.scan(item)
      @co.scan(item2)
      @co.scan(item3)
      @co.total.must_equal(66.78)
    end

    it "should return correct price for Basket: 001, 003, 001" do        
      item = Product.new('001', 9.25)
      item2 = Product.new('001', 9.25)      
      item3 = Product.new('003', 19.95)
      @co.scan(item)
      @co.scan(item2)
      @co.scan(item3)
      @co.total.must_equal(36.95)
    end

    it "should return correct price for Basket: 001, 002, 001, 003" do        
      item = Product.new('001', 9.25)
      item3 = Product.new('003', 19.95)
      item2 = Product.new('001', 9.25)      
      item4 = Product.new('002', 45.00)
      @co.scan(item)
      @co.scan(item2)
      @co.scan(item3)
      @co.scan(item4)
      @co.total.must_equal(73.76)
    end

  end
     
end
