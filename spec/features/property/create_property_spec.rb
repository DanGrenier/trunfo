require 'rails_helper'

RSpec.feature "Create Properties", type: :feature do 
  let!(:user) {create(:user)}
  
  scenario "Visit new property from home page"  do 
  	#We use a method to login to make writing tests faster
  	simulate_sign_in(user)
    visit "/"
  	click_link "Add Property"
    expect(page).to have_field("Description")
  end

  scenario "Visit new property from properties list" do 
    simulate_sign_in(user)
    within("#main-menu") do 
      click_link "Properties"
    end
    expect(page).to have_content("No properties on file")
    click_link "Add Property"
    expect(page).to have_field("Description")
  end

  scenario "Create Property with pictue", js: true do 
  	simulate_sign_in(user)
    visit root_path
    click_link "Add Property"
    expect(page).to have_button("Save property")
  	click_button 'Save property'
  	fill_in "Description", with: "My Property"
  	fill_in "Address", with: "My Address"
  	fill_in "City", with: "Athens"
  	fill_in "State", with: "GA"
  	fill_in "Zip", with: "30606"
    
    page.attach_file("Picture", Rails.root.join('spec','factories','files','home.jpg'))
    
  	click_button 'Save property'
    
  	expect(page).to have_content "Select property to manage"
  	expect(page).to have_content "My Property"
    property = Property.last
    expect(page.find("#property_thumbnail")['src']).to have_content(rails_representation_path(property.thumbnail))
  end

  scenario "Create Property with Valid information", js: true do 
    simulate_sign_in(user)
    visit "/"
    click_link "Add Property"
    expect(page).to have_button("Save property")
    fill_in "Description", with: "My Property"
    fill_in "Address", with: "My Address"
    fill_in "City", with: "Athens"
    fill_in "State", with: "GA"
    fill_in "Zip", with: "30606"
    
    click_button 'Save property'
    
    expect(page).to have_content "Select property to manage"
    expect(page).to have_content "My Property"
  end

  scenario "Cannot Create Property with Invalid information", js: true do
    simulate_sign_in(user)
    visit new_property_path
    fill_in "Description", with: ""
    fill_in "Address", with: "My Address"
    fill_in "City", with: "Athens"
    fill_in "State", with: "GA"
    fill_in "Zip", with: "30606"
    click_button 'Save property'
    
    expect(page.find_field("Description").value).to eq("")
    expect(page).to have_content("Problem detected trying to save Property")
  end
end
