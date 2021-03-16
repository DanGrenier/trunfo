require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user1) {create :user}

	it "has a valid factory" do 
		expect(user1).to be_valid
	end

	it "is invalid without an email" do 
		expect(build(:user, email: nil)).not_to be_valid
	end

	it "is invalid without a password" do 
		expect(build(:user, password: nil)).not_to be_valid
	end

	it "is invalid without wrong email" do 
		expect(build(:user, email: "bademail.com")).not_to be_valid
	end

	it "does not allow the same email to be used twice" do 
		expect(build(:user, email: user1.email)).not_to be_valid
	end

  
end
