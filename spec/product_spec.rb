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
  end

end