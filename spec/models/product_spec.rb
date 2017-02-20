require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it "should create a product" do
      @cat = Category.new
      @product = @cat.products.new(name: "charger", price: 120, quantity: 100)
      expect(@product).to be_valid
    end
    it "misses name field, therefore should not create a product" do
      @cat = Category.new
      @product = @cat.products.new(price: 120, quantity: 100)
      expect(@product).to_not be_valid
    end
    it "misses price field, therefore should not create a product" do
      @cat = Category.new
      @product = @cat.products.new(name: "charger", quantity: 100)
      expect(@product).to_not be_valid
    end
    it "misses quantity field, therefore should not create a product" do
      @cat = Category.new
      @product = @cat.products.new(name: "charger", price: 120)
      expect(@product).to_not be_valid
    end
  end
end
