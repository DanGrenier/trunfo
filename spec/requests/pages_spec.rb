require "rails_helper"

RSpec.describe "Home", type: :request do 
	
	describe "User Not Signed In" do
	  it "returns a successful response" do
	    get root_path 
	    expect(response).to be_successful
	  end

	  it "Shows the home page" do 
	  	get root_path 
	  	expect(response.body).to include("Welcome")
	  end
  end
end