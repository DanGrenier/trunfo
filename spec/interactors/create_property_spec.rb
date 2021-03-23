require "rails_helper"

RSpec.describe "Interactor - CreateProperty", type: :interactor do 
	let!(:user) {create(:user)}
	let!(:params) {FactoryBot.attributes_for(:property,user: user)}


	describe ".call" do 
		context "When given valid attributes" do 
			subject {CreateProperty.call(params: params, user: user)} 
			it "should create a property" do 
				interactor = subject
				expect(interactor).to be_a_success
				expect(interactor.property).to eq(Property.last)
			end

		end

		context "When given invalid attributes" do 
			subject {CreateProperty.call(params: params.merge(description: nil), user: user)}
			it "should not create a property" do 
				interactor = subject
				expect(interactor).to be_a_failure
			end

		end
	end

end