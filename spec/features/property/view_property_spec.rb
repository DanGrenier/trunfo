require 'rails_helper'

RSpec.feature "View Properties", type: :feature do 
  let!(:user) {create(:user)}	
  let!(:user2) {create(:user)}
  let!(:property) {create(:property, :with_picture, user: user, description: "My Property")}
  let!(:property2) {create(:property, user: user2, description: "Someone Else Property")}
  
  scenario "Can only view own properties"  do 
    simulate_sign_in(user)
  	visit '/'
  	visit properties_path
  	expect(page).to have_content(property.description)
    expect(page).to_not have_content(property2.description)
  end

end
