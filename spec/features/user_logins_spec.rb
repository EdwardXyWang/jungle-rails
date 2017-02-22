require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do

  # SETUP
  before :each do

    @user = User.create!(
      first_name: 'First User',
      last_name: 'lastUser',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )

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

  scenario "Adding product leads to the number increment in cart" do
    visit root_path
    visit new_session_path

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end

    save_screenshot
    expect(page).to have_content "Log out"
  end
end
