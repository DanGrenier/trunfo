require "rails_helper"

RSpec.describe "Interactor - UpdateProperty", type: :interactor do 
	let!(:user) {create(:user)}
	let!(:current_property) {create :property, user: user}
	let(:changed_attributes) {current_property.attributes.symbolize_keys.merge(description: "New Description")}

	describe ".call" do 
		context "When given valid attributes" do 
			subject {UpdateProperty.call(property: current_property,params: changed_attributes, user: user)}
			it "should update property" do 
				interactor = subject
				expect(interactor).to be_a_success
				expect(current_property.reload.description).to eq changed_attributes[:description]
			end

		end

		context "When given invalid attributes" do 
			subject {UpdateProperty.call(property: current_property, params: changed_attributes.merge(description: nil), user: user)}
			it "should not update property" do 
				interactor = subject
				expect(interactor).to be_a_failure
				expect(current_property.reload.description).to_not eq nil
			end

		end
	end

end