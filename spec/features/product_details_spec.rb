require 'rails_helper'

RSpec.feature "Visitors can navigate from home page to product detail page", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "by clicling on a product" do
      visit root_path

      click_link('Details', match: :first)
      expect(page).to have_text(/description/i)
      save_screenshot

    end
end
