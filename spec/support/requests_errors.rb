require 'rails_helper'

shared_examples_for 'user_not_signed_in' do 
  
  it "should return an unsuccessful response" do 
    subject
    expect(response).to_not be_successful
  end

  it "should redirect to user sign in page" do 
    subject
     expect(response).to redirect_to (new_user_session_path)
  end
  
end





