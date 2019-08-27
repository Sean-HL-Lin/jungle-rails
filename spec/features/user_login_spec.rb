require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
  
  before :each do
  @user = User.create!({
    last_name: 'Lin',
    first_name: 'Sean',
    email: 'sean@sean',
    password: 'sean123',
    password_confirmation: 'sean123'
  })
  end

  scenario "User can login " do
    # ACT
    visit '/'

    first("a", text: "Login").click
    fill_in "email", with: "sean@sean"
    fill_in "password", with: "sean123"

    
    find('input[name="commit"]').click

    sleep 4
    puts page.html
    save_screenshot


  end
end
