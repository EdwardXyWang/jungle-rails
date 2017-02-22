require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
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

  scenario "They can see the details of products" do
    # ACT
    visit root_path
    first('article.product').find_link('Details').click

    expect(page).to have_css 'article.product-detail'
    # DEBUG / VERIFY
    save_screenshot

  end
end
