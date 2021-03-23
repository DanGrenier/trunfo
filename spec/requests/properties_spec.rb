require "rails_helper"

RSpec.describe "Properties", type: :request do 

	let!(:user) {create(:user)}
	let!(:second_user) {create(:user)}

	let!(:property) {create(:property, user: user)}
	let!(:property2) {create(:property, user: second_user)}

	describe "User Not Signed in"

	describe 'GET #index' do 
		subject {get properties_path}
		it_behaves_like 'user_not_signed_in'
  end

  describe 'GET #show' do 
  	subject {get property_path property}
  	it_behaves_like 'user_not_signed_in'
  end

  describe 'GET #new' do 
  	subject {get new_property_path}
  	it_behaves_like 'user_not_signed_in'
  end

  describe 'GET #edit' do 
  	subject {get edit_property_path property}
  	it_behaves_like 'user_not_signed_in'
  end

  describe 'PATCH #update' do 
  	subject {patch property_path property, params: {property: attributes_for(:property, user: user, description: "New Description")}}

  	it "does not update the record in the database" do 
  		subject
  		expect(property.reload.description).to_not eq("New Description")
  	end

  	it_behaves_like 'user_not_signed_in'
  end

  describe "POST #create" do
     
    subject {post properties_path, params: {property: FactoryBot.attributes_for(:property, user: user) }} 
 
    it "does not change the number of Properties" do 
      expect {subject}.to_not change {Property.count}
    end

    it_behaves_like 'user_not_signed_in'
  end

  describe "DELETE #destroy" do
      
    subject {delete property_path property}
 
    it "does not delete the property in the database" do 
      expect {subject}.to_not change {Property.count}
    end

    it_behaves_like 'user_not_signed_in' 

  end
    
end