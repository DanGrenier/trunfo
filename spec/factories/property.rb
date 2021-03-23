require 'faker'

FactoryBot.define do
  factory :property do
  	sequence(:description) {|n| "Main property #{n}"}
  	address {Faker::Address.street_address}
  	address2 {Faker::Address.secondary_address}
  	city {Faker::Address.city}
  	state {Faker::Address.state_abbr}
  	zip {Faker::Address.zip}
  	association :user 

  	trait :with_picture do 
  		property_picture {fixture_file_upload(Rails.root.join('spec','factories','files','home.jpg'),'image/jpg')}
  	end
  end	

  factory :secondary_property, class: Property do |sp|
    sp.description {"Secondary Property"}
    sp.address {Faker::Address.street_address}
    sp.address2 {Faker::Address.secondary_address}
    sp.city {Faker::Address.city}
    sp.state {Faker::Address.state_abbr}
    sp.zip {Faker::Address.zip}
    sp.association :user
    
    trait :with_picture do 
      sp.property_picture {fixture_file_upload(Rails.root.join('spec','factories','files','cabin.jpg'),'image/jpg')}
    end
  end
end