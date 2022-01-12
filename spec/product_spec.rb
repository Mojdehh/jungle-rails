require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save a valid product" do
      @category = Category.create(name: 'Shoes')
      @product = Product.new(
        name: "Chic",
        price_cents: 8000,
        quantity: 12,
        category_id: @category.id
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it "should not save without a name" do
      @category = Category.create(name: 'Shoes')
      @product = Product.new(
        name: nil,
        price_cents: 8000,
        quantity: 12,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

  end

end