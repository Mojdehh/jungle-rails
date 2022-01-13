require 'rails_helper'

RSpec.feature "Visitors can add items to cart", type: :feature, js: true do

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

  scenario "Add item to cart and number of cart changes" do
    visit root_path

    click_button('Add', match: :first)
    expect(page).to have_text('My Cart (1)')
    save_screenshot 'itemAdded.png'

    # puts page.html
  end
end
