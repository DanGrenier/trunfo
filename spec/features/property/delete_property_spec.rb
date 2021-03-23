require 'rails_helper'

RSpec.feature "Feature - Delete Property", type: :feature do 
  let!(:user) {create(:user)}	
  let!(:properties) {create_list(:property,5, user: user)}
  

  scenario "User Can delete one specific property", js: true do 
    desc = properties.first.description
    visit '/'
    simulate_sign_in(user)
    visit properties_path
     accept_alert do 
      within("table#properties_table") do
        first("#delete_property_link").click
      end
    end

    sleep 1
    
    expect(page).to_not have_content(desc)
    
  end





end
