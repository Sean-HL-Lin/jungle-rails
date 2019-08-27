require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do

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

    scenario "Product should be added to cart" do
      visit '/'
      expect(page).to have_content("My Cart (0)")
      

      first("button", text: "Add").click
      expect(page).to have_content("My Cart (1)")

      save_screenshot
    end

end
